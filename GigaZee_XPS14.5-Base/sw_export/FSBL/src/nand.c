/******************************************************************************
*
* (c) Copyright 2012-2013 Xilinx, Inc. All rights reserved.
*
* This file contains confidential and proprietary information of Xilinx, Inc.
* and is protected under U.S. and international copyright and other
* intellectual property laws.
*
* DISCLAIMER
* This disclaimer is not a license and does not grant any rights to the
* materials distributed herewith. Except as otherwise provided in a valid
* license issued to you by Xilinx, and to the maximum extent permitted by
* applicable law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL
* FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS,
* IMPLIED, OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF
* MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE;
* and (2) Xilinx shall not be liable (whether in contract or tort, including
* negligence, or under any other theory of liability) for any loss or damage
* of any kind or nature related to, arising under or in connection with these
* materials, including for any direct, or any indirect, special, incidental,
* or consequential loss or damage (including loss of data, profits, goodwill,
* or any type of loss or damage suffered as a result of any action brought by
* a third party) even if such damage or loss was reasonably foreseeable or
* Xilinx had been advised of the possibility of the same.
*
* CRITICAL APPLICATIONS
* Xilinx products are not designed or intended to be fail-safe, or for use in
* any application requiring fail-safe performance, such as life-support or
* safety devices or systems, Class III medical devices, nuclear facilities,
* applications related to the deployment of airbags, or any other applications
* that could lead to death, personal injury, or severe property or
* environmental damage (individually and collectively, "Critical
* Applications"). Customer assumes the sole risk and liability of any use of
* Xilinx products in Critical Applications, subject only to applicable laws
* and regulations governing limitations on product liability.
*
* THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE
* AT ALL TIMES.
*
*******************************************************************************/
/*****************************************************************************/
/**
*
* @file nand.c
*
* Contains code for the NAND FLASH functionality. Bad Block management
* is simple: skip the bad blocks and keep going.
*
* <pre>
* MODIFICATION HISTORY:
*
* Ver	Who	Date		Changes
* ----- ---- -------- -------------------------------------------------------
* 1.00a ecm	01/10/10 Initial release
* 2.00a  mb	25/05/12 fsbl changes for standalone bsp based
* 3.00a sgd	30/01/13 Code cleanup
* </pre>
*
* @note
*
******************************************************************************/

/***************************** Include Files *********************************/
#include "xparameters.h"
#include "fsbl.h"
#ifdef XPAR_PS7_NAND_0_BASEADDR
#include "nand.h"
#include "xnandps_bbm.h"


/************************** Constant Definitions *****************************/

#define NAND_DEVICE_ID		XPAR_XNANDPS_0_DEVICE_ID

/**************************** Type Definitions *******************************/

/***************** Macros (Inline Functions) Definitions *********************/

/************************** Function Prototypes ******************************/

u32 ReadNand(u32 Address,u32 *Data);

/************************** Variable Definitions *****************************/

extern u32 FlashReadBaseAddress;
extern u32 FlashOffsetAddress;

XNandPs *NandInstPtr;
XNandPs NandInstance; /* XNand Instance. */

/******************************************************************************/
/**
*
* This function initializes the controller for the NAND FLASH interface.
*
* @param	none
*
* @return
*		- XST_SUCCESS if the controller initializes correctly
*		- XST_FAILURE if the controller fails to initializes correctly
*
* @note		none.
*
****************************************************************************/
u32 InitNand(void)
{

	u32 Status;
	XNandPs_Config *ConfigPtr;

	/*
	 * Set up pointers to instance and the config structure
	 */
	NandInstPtr = &NandInstance;

	/*
	 * Initialize the flash driver.
	 */
	ConfigPtr = XNandPs_LookupConfig(NAND_DEVICE_ID);

	if (ConfigPtr == NULL) {
		fsbl_printf(DEBUG_GENERAL,"Nand Driver failed \n \r");
		return XST_FAILURE;
	}

	Status = XNandPs_CfgInitialize(NandInstPtr, ConfigPtr,
			ConfigPtr->SmcBase,ConfigPtr->FlashBase);
	if (Status != XST_SUCCESS) {
		fsbl_printf(DEBUG_GENERAL,"NAND intialization failed \n \r");
		return XST_FAILURE;
	}

	/*
	 * Set up base address for access
	 */
	FlashReadBaseAddress = XPS_NAND_BASEADDR;

	fsbl_printf(DEBUG_INFO,"InitNand: Geometry = 0x%x\r\n",
		NandInstPtr->Geometry.FlashWidth);

	if (Status != XST_SUCCESS) {
		fsbl_printf(DEBUG_GENERAL,"InitNand: Status = 0x%.8x\r\n", 
				Status);
		return XST_FAILURE;
	}

	/*
	 * set up the FLASH access pointers
	 */
	fsbl_printf(DEBUG_INFO,"Nand driver initialized \n\r");

	return XST_SUCCESS;
}

/******************************************************************************/
/**
*
* This function reads the requested data from NAND FLASH interface.
* This function does not handle bad blocks. Return what it is.
*
* @param	Address into the FLASH data space
*
* @return	Data at the provided offset in the FLASH
*
* @note		None.
*
****************************************************************************/
u32 ReadNand(u32 Address, u32 *Data)
{

	u32 Status;
	u32 Page;
	u32 *WordPtr;

	fsbl_printf(DEBUG_INFO,"ReadNand: Address = 0x%.8x\r\n", Address);

	WordPtr = (u32 *)NandInstance.DataBuf;

	Page = (Address)/(NandInstance.Geometry.BytesPerPage);

	Status = XNandPs_Read(NandInstPtr,
				(u64)(Page * (NandInstance.Geometry.BytesPerPage)),
				NandInstance.Geometry.BytesPerPage,
				NandInstance.DataBuf,NULL);
	if (Status != XST_SUCCESS) {
		fsbl_printf(DEBUG_GENERAL,"ReadNand Failed: Status = 0x%.8x\r\n",
				 Status);
		return XST_FAILURE;
	}

	*Data = WordPtr[((Address) & (NandInstance.Geometry.BytesPerPage - 1))/4];

	return Status;
}

/******************************************************************************/
/**
*
* This function provides the NAND FLASH interface for the Simplified header
* functionality. This function handles bad blocks.
*
* The source address is the absolute good address, bad blocks are skipped
* without incrementing the source address.
*
* @param	SourceAddress is address in FLASH data space, absolute good address
* @param	DestinationAddress is address in OCM data space
*
* @return	XST_SUCCESS if the transfer completes correctly
*		XST_FAILURE if the transfer fails to completes correctly
*
* @note	none.
*
****************************************************************************/
u32 NandAccess(u32 SourceAddress, u32 DestinationAddress, u32 LengthBytes)
{
	u32 Status = XST_SUCCESS;
	u32 PageSizeMask;
	u32 PageSize;
	u32 BytesPerBlock;
	u32 TempSourceAddress;
	u32 ByteCount = 0;
	u32 TmpAddress = 0;
	int BlockCount = 0;
	int BadBlocks = 0;
	u32 LastBlockCount = 0;
	u32 Data;

	PageSize = NandInstance.Geometry.BytesPerPage;
	PageSizeMask = PageSize - 1;
	TempSourceAddress = SourceAddress;
	BytesPerBlock = (NandInstance.Geometry.PagesPerBlock * PageSize);
	Data = 0xFFFFFFFF;

	/*
	 * First get bad blocks before the source address
	 */
	while (TmpAddress < SourceAddress) {
		while (XNandPs_IsBlockBad(NandInstPtr, BlockCount) ==
							XST_SUCCESS) {
			BlockCount ++;
			BadBlocks ++;
		}

		TmpAddress += BytesPerBlock;
		BlockCount ++;
	}

	/*
	 * Previous loop advanced BlockCount one more too much
	 */
	LastBlockCount = BlockCount - 1;

	/*
	 * Now transfer with bad block skipping
	 */
	while (ByteCount < LengthBytes) {
		int TmpBadBlocks = 0;
		int Length;

		TempSourceAddress = SourceAddress + ByteCount +
								BadBlocks * BytesPerBlock;
		BlockCount = TempSourceAddress / BytesPerBlock;

		/*
		 * If advance to the next block, needs to check bad block
		 */
		if (BlockCount > LastBlockCount) {
			LastBlockCount = BlockCount;

		while (XNandPs_IsBlockBad(NandInstPtr, BlockCount) ==
						XST_SUCCESS) {

			BlockCount ++;
			TmpBadBlocks ++;
			fsbl_printf(DEBUG_INFO,"Found bad block %d: %d\r\n",
						BlockCount, TmpBadBlocks);
		}

		if (TmpBadBlocks) {
			BadBlocks += TmpBadBlocks;
			TempSourceAddress += TmpBadBlocks * BytesPerBlock;
			LastBlockCount += TmpBadBlocks;
			}
		}

		if (LengthBytes == 4) {
			Status = ReadNand(TempSourceAddress,&Data);
			*((u32 *)DestinationAddress) = Data;

			return Status;
		}

		/*
		 * NAND transfer is page-wise
		 */
		Length = PageSize - (TempSourceAddress & PageSizeMask);

		if ((Length + ByteCount) > LengthBytes) {
			Length = LengthBytes - ByteCount;
		}

		Status = XNandPs_Read(NandInstPtr,
					(u64)TempSourceAddress,
					Length,
					(u32 *)(DestinationAddress + ByteCount),
					NULL);

		if (Status != XST_SUCCESS) {
			fsbl_printf(DEBUG_GENERAL,"NandAccess Failed: source %x, "
					 "count %d, destinationaddr %x, "
					 "Status = 0x%.8x\r\n",
					 (u64)TempSourceAddress, Length,
					 DestinationAddress + ByteCount, Status);
			return Status;
		}
		ByteCount += Length;
	}

	return Status;
}

#endif
