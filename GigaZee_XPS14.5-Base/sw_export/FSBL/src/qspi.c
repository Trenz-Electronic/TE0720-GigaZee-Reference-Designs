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
* @file qspi.c
*
* Contains code for the QSPI FLASH functionality.
*
* <pre>
* MODIFICATION HISTORY:
*
* Ver	Who	Date		Changes
* ----- ---- -------- -------------------------------------------------------
* 1.00a ecm	01/10/10 Initial release
* 3.00a mb  25/06/12 InitQspi, data is read first and required config bits
*                     are set
* 4.00a sg	02/28/13 Cleanup
* 					 Removed LPBK_DLY_ADJ register setting code as we use
* 					 divisor 8
* </pre>
*
* @note
*
******************************************************************************/

/***************************** Include Files *********************************/

#include "qspi.h"
#include "image_mover.h"

#ifdef XPAR_PS7_QSPI_LINEAR_0_S_AXI_BASEADDR
#include "xqspips_hw.h"
#include "xqspips.h"
#endif

/************************** Constant Definitions *****************************/

/**************************** Type Definitions *******************************/


/***************** Macros (Inline Functions) Definitions *********************/

/************************** Function Prototypes ******************************/

/************************** Variable Definitions *****************************/

extern u32 FlashReadBaseAddress;

/******************************************************************************/
/******************************************************************************/
/**
*
* This function initializes the controller for the QSPI interface.
*
* @param	None
*
* @return	None
*
* @note		None  
*
****************************************************************************/
void InitQspi(void)
{
#ifdef XPAR_PS7_QSPI_LINEAR_0_S_AXI_BASEADDR
	u32 QspiControlReg = 0;
	u32 Prescaler = XQSPIPS_CLK_PRESCALE_8;

	/*
	 * Set up the base address for access
	 */
	FlashReadBaseAddress = XPS_QSPI_LINEAR_BASEADDR;

	/*
	 * Fix for CR#664560
	 * Baud rate to DIV/8 pre-scaler value
	 */
	QspiControlReg = Xil_In32((XPS_QSPI_BASEADDR + XQSPIPS_CR_OFFSET));
	QspiControlReg &= ~XQSPIPS_CR_PRESC_MASK;
	QspiControlReg |= (u32) (Prescaler & XQSPIPS_CR_PRESC_MAXIMUM) <<
				XQSPIPS_CR_PRESC_SHIFT;

	Xil_Out32((XPS_QSPI_BASEADDR + XQSPIPS_CR_OFFSET), QspiControlReg);
#endif
}


/******************************************************************************/
/**
*
* This function provides the QSPI FLASH interface for the Simplified header
* functionality.
*
* @param	SourceAddress is address in FLASH data space
* @param	DestinationAddress is address in DDR data space
* @param	LengthBytes is the length of the data in Bytes
*
* @return
*		- XST_SUCCESS if the write completes correctly
*		- XST_FAILURE if the write fails to completes correctly
*
* @note	none.
*
****************************************************************************/
u32 QspiAccess( u32 SourceAddress, u32 DestinationAddress, u32 LengthBytes)
{
#ifdef XPAR_PS7_QSPI_LINEAR_0_S_AXI_BASEADDR
	u32 Data;
	u32 Count;
	u32 *SourceAddr;
	u32 *DestAddr;
	

	/*
	 * Check for non-word tail, add bytes to cover the end
	 */
	if ((LengthBytes%4) != 0){
		LengthBytes += (4 - (LengthBytes & 0x00000003));
	}


	SourceAddr = (u32 *)(SourceAddress + FlashReadBaseAddress);

	DestAddr = (u32 *)(DestinationAddress);

	/*
	 * Word transfers, endianism isn't an	issue
	 */
	for (Count=0; Count < (LengthBytes / 4); Count++){

		Data = Xil_In32((u32)(SourceAddr));
		SourceAddr++;
		Xil_Out32((u32)(DestAddr), Data);
		DestAddr++;
	}
#endif

	return XST_SUCCESS;
}

