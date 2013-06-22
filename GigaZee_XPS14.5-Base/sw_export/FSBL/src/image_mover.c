/******************************************************************************
*
* (c) Copyright 2011-2013 Xilinx, Inc. All rights reserved.
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
* @file image_mover.c
*
* Move partitions to either DDR to execute or to program FPGA.
* It performs partition walk.
*
* <pre>
* MODIFICATION HISTORY:
*
* Ver	Who	Date		Changes
* ----- ---- -------- -------------------------------------------------------
* 1.00a jz	05/24/11	Initial release
* 2.00a jz	06/30/11	Updated partition header defs for 64-byte
*			 			alignment change in data2mem tool
* 2.00a mb	05/25/12	Updated for standalone based bsp FSBL
* 			 			Nand/SD encryption and review comments
* 3.00a np	08/30/12	Added FSBL user hook calls
* 						(before and after bitstream download.)
* 4.00a sgd	02/28/13	Fix for CR#691148
*						Fix for CR#695578
*
* </pre>
*
* @note
*	A partition is either an executable or a bitstream to program FPGA
*
******************************************************************************/

/***************************** Include Files *********************************/
#include "fsbl.h"
#include "image_mover.h"
#include "xil_printf.h"
#include "xreg_cortexa9.h"
#include "pcap.h"

/************************** Constant Definitions *****************************/

/* We are 32-bit machine */
#define MAXIMUM_IMAGE_WORD_LEN 0x40000000
#define MD5_CHECKSUM_SIZE   16

/**************************** Type Definitions *******************************/

/***************** Macros (Inline Functions) Definitions *********************/

/************************** Function Prototypes ******************************/


/************************** Variable Definitions *****************************/
u32 ExecutionAddress;
ImageMoverType MoveImage;

/*
 * Header array
 */
PartHeader PartitionHeader[MAX_PARTITION_NUMBER];
u32 PartitionCount;

extern u32 FlashReadBaseAddress;
extern u8 EncryptedPartitionFlag;
extern u8 PLPartitionFlag;
extern u8 PSPartitionFlag;
extern u8 SignedPartitionFlag;
extern u8 LinearBootDeviceFlag;

/*****************************************************************************/
/**
*
* This function loads all partition header information in global array
*
* @param	ImageAddress is the start address of the image
*
* @return	- XST_SUCCESS if Get partition Header information successful
*			- XST_FAILURE if Get Partition Header information failed
*
* @note		None
*
****************************************************************************/
u32 GetPartitionHeaderInfo(u32 ImageBaseAddress)
{
    u32 PartitionHeaderOffset;
    u32 Status;

    /*
    * Get the start address of the partition header table
    */
    Status = GetPartitionHeaderStartAddr(ImageBaseAddress,
    				&PartitionHeaderOffset);
    if (Status != XST_SUCCESS) {
    	fsbl_printf(DEBUG_GENERAL, "Get Header Start Address Failed\r\n");
    	return XST_FAILURE;
    }

    /*
     * Header offset on flash
     */
    PartitionHeaderOffset += ImageBaseAddress;

    fsbl_printf(DEBUG_INFO,"Partition Header Offset:0x%08x\r\n",
    		PartitionHeaderOffset);

    /*
     * Load all partitions header data in to global variable
     */
    Status = LoadPartitionsHeaderInfo(PartitionHeaderOffset,
    				&PartitionHeader[0]);
    if (Status != XST_SUCCESS) {
    	fsbl_printf(DEBUG_GENERAL, "Header Information Load Failed\r\n");
    	return XST_FAILURE;
    }

    /*
     * Get partitions count from partitions header information
     */
	PartitionCount = GetPartitionCount(&PartitionHeader[0]);

    fsbl_printf(DEBUG_INFO, "Partition Count: %d\r\n", PartitionCount);

    /*
     * Partition Count check
     */
    if (PartitionCount >= MAX_PARTITION_NUMBER) {
        fsbl_printf(DEBUG_GENERAL, "Invalid Partition Count\r\n");
		return XST_FAILURE;

    } else if (PartitionCount <= 1) {
        fsbl_printf(DEBUG_GENERAL, "There is no partition to load\r\n");
		return XST_FAILURE;
    }

    return XST_SUCCESS;
}


/*****************************************************************************/
/**
*
* This function goes to the partition header of the specified partition
*
* @param	ImageAddress is the start address of the image
*
* @return	Offset Partition header address of the image
*
* @return	- XST_SUCCESS if Get Partition Header start address successful
* 			- XST_FAILURE if Get Partition Header start address failed
*
* @note		None
*
****************************************************************************/
u32 GetPartitionHeaderStartAddr(u32 ImageAddress, u32 *Offset)
{
	u32 Status;

	Status = MoveImage(ImageAddress + IMAGE_PHDR_OFFSET, (u32)Offset, 4);
	if (Status != XST_SUCCESS) {
		fsbl_printf(DEBUG_GENERAL,"Move Image failed\r\n");
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

/*****************************************************************************/
/**
*
* This function get the header information of the all the partitions and load into
* global array
*
* @param	PartHeaderOffset Offset address where the header information present
*
* @param	Header Partition header pointer
*
* @return	- XST_SUCCESS if Load Partitions Header information successful
*			- XST_FAILURE if Load Partitions Header information failed
*
* @note		None
*
****************************************************************************/
u32 LoadPartitionsHeaderInfo(u32 PartHeaderOffset,  PartHeader *Header)
{
	u32 Status;

	Status = MoveImage(PartHeaderOffset, (u32)Header, sizeof(PartHeader)*MAX_PARTITION_NUMBER);
	if (Status != XST_SUCCESS) {
		fsbl_printf(DEBUG_GENERAL,"Move Image failed\r\n");
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}


/*****************************************************************************/
/**
*
* This function dumps the partition header.
*
* @param	Header Partition header pointer
*
* @return	None
*
* @note		None
*
******************************************************************************/
void HeaderDump(PartHeader *Header)
{
	fsbl_printf(DEBUG_INFO, "Header Dump\r\n");
	fsbl_printf(DEBUG_INFO, "Image Word Len: 0x%08x\r\n",
									Header->ImageWordLen);
	fsbl_printf(DEBUG_INFO, "Data Word Len: 0x%08x\r\n",
									Header->DataWordLen);
	fsbl_printf(DEBUG_INFO, "Partition Word Len:0x%08x\r\n",
									Header->PartitionWordLen);
	fsbl_printf(DEBUG_INFO, "Load Addr: 0x%08x\r\n",
									Header->LoadAddr);
	fsbl_printf(DEBUG_INFO, "Exec Addr: 0x%08x\r\n",
									Header->ExecAddr);
	fsbl_printf(DEBUG_INFO, "Partition Start: 0x%08x\r\n",
									Header->PartitionStart);
	fsbl_printf(DEBUG_INFO, "Partition Attr: 0x%08x\r\n",
									Header->PartitionAttr);
	fsbl_printf(DEBUG_INFO, "Section Count: 0x%08x\r\n",
									Header->SectionCount);
	fsbl_printf(DEBUG_INFO, "Checksum: 0x%08x\r\n",
									Header->CheckSum);
}


/******************************************************************************/
/**
*
* This function calculates the partitions count from header information
*
* @param	Header Partition header pointer
*
* @return	Count Partition count
*
* @note		None
*
*******************************************************************************/
u32 GetPartitionCount(PartHeader *Header)
{
    u32 Count=0;
    struct HeaderArray *Hap;

    for(Count = 0; Count < MAX_PARTITION_NUMBER; Count++) {
        Hap = (struct HeaderArray *)&Header[Count];
        if(IsLastPartition(Hap)!=XST_FAILURE)
            break;
    }

	return Count;
}

/******************************************************************************/
/**
* This function check whether the current partition is the end of partitions
*
* The partition is the end of the partitions if it looks like this:
*	0x00000000
*	0x00000000
*	....
*	0x00000000
*	0x00000000
*	0xFFFFFFFF
*
* @param	H is a pointer to struct HeaderArray
*
* @return
*		- XST_SUCCESS if it is the last partition
*		- XST_FAILURE if it is not last partition
*
****************************************************************************/
u32 IsLastPartition(struct HeaderArray *H)
{
	int Index;

	if (H->Fields[PARTITION_HDR_CHECKSUM_WORD_COUNT] != 0xFFFFFFFF) {
		return	XST_FAILURE;
	}

	for (Index = 0; Index < PARTITION_HDR_WORD_COUNT - 1; Index++) {

        if (H->Fields[Index] != 0x0) {
			return XST_FAILURE;
		}
	}

    return XST_SUCCESS;
}


/******************************************************************************/
/**
*
* This function validates the partition header.
*
* @param	Header Partition header pointer
*
* @return
*		- XST_FAILURE if bad header.
* 		- XST_SUCCESS if successful.
*
* @note		None
*
*******************************************************************************/
u32 ValidateHeader(PartHeader *Header)
{
	struct HeaderArray *Hap;

    Hap = (struct HeaderArray *)Header;

	/*
	 * If there are no partitions to load, fail
	 */
	if (IsEmptyHeader(Hap) == XST_SUCCESS) {
		fsbl_printf(DEBUG_GENERAL, "IMAGE_HAS_NO_PARTITIONS\r\n");
	    return XST_FAILURE;
	}

	/*
	 * Validate partition header checksum
	 */
	if (ValidatePartitionHeaderChecksum(Hap) != XST_SUCCESS) {
		fsbl_printf(DEBUG_GENERAL, "PARTITION_HEADER_CORRUPTION\r\n");
		return XST_FAILURE;
	}

    /*
     * Validate partition data size
     */
	if (Header->ImageWordLen > MAXIMUM_IMAGE_WORD_LEN) {
		fsbl_printf(DEBUG_GENERAL, "INVALID_PARTITION_LENGTH\r\n");
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}


/******************************************************************************/
/**
* This function check whether the current partition header is empty.
* A partition header is considered empty if image word length is 0 and the
* last word is 0.
*
* @param	H is a pointer to struct HeaderArray
*
* @return
*		- XST_SUCCESS , If the partition header is empty
*		- XST_FAILURE , If the partition header is NOT empty
*
* @note		Caller is responsible to make sure the address is valid.
*
*
****************************************************************************/
u32 IsEmptyHeader(struct HeaderArray *H)
{
	int Index;

	for (Index = 0; Index < PARTITION_HDR_WORD_COUNT; Index++) {
		if (H->Fields[Index] != 0x0) {
			return XST_FAILURE;
		}
	}

	return XST_SUCCESS;
}


/******************************************************************************/
/**
*
* This function checks the header checksum If the header checksum is not valid
* XST_FAILURE is returned.
*
* @param	H is a pointer to struct HeaderArray
*
* @return
*		- XST_SUCCESS is header checksum is ok
*		- XST_FAILURE if the header checksum is not correct
*
* @note		None.
*
****************************************************************************/
u32 ValidatePartitionHeaderChecksum(struct HeaderArray *H)
{
	u32 Checksum;
	u32 Count;

	Checksum = 0;

	for (Count = 0; Count < PARTITION_HDR_CHECKSUM_WORD_COUNT; Count++) {
		/*
		 * Read the word from the header
		 */
		Checksum += H->Fields[Count];
	}

	/*
	 * Invert checksum, last bit of error checking
	 */
	Checksum ^= 0xFFFFFFFF;

	/*
	 * Validate the checksum
	 */
	if (H->Fields[PARTITION_HDR_CHECKSUM_WORD_COUNT] != Checksum) {
	    fsbl_printf(DEBUG_GENERAL, "Error: Checksum 0x%8.8x != 0x%8.8x\r\n",
			Checksum, H->Fields[PARTITION_HDR_CHECKSUM_WORD_COUNT]);
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}


/******************************************************************************/
/**
*
* This function load the partition from boot device
*
* @param	ImageBaseAddress Base address on flash
* @param	Header Partition header pointer
*
* @return
*		- XST_SUCCESS if partition move successful
*		- XST_FAILURE if check failed move failed
*
* @note		None
*
*******************************************************************************/
u32 PartitionMove(u32 ImageBaseAddress, PartHeader *Header)
{
    u32 SourceAddr;
    u32 Status;
    u8 SecureTransferFlag = 0;
    u32 LoadAddr;
    u32 ImageWordLen;
    u32 DataWordLen;

	SourceAddr = ImageBaseAddress;
	SourceAddr += Header->PartitionStart<<WORD_LENGTH_SHIFT;
	LoadAddr = Header->LoadAddr;
	ImageWordLen = Header->ImageWordLen;
	DataWordLen = Header->DataWordLen;

	/*
	 * Add flash base address for linear boot devices
	 */
	if (LinearBootDeviceFlag) {
		SourceAddr += FlashReadBaseAddress;
	}

	/*
	 * Partition encrypted
	 */
	if(EncryptedPartitionFlag) {
		SecureTransferFlag = 1;
	}

	/*
	 * For Signed partition, Total partition image need to copied to DDR
	 */
	if (SignedPartitionFlag) {
		ImageWordLen = Header->PartitionWordLen;
		DataWordLen = Header->PartitionWordLen;
	}

	/*
	 * Encrypted and Signed PS partition need to be loaded on to DDR
	 * without decryption
	 */
	if(PSPartitionFlag && SignedPartitionFlag && EncryptedPartitionFlag) {
		SecureTransferFlag = 0;
	}

	/*
	 * CPU is used for data transfer in case of non-linear
	 * boot device
	 */
	if (!LinearBootDeviceFlag) {
		/*
		 * PL partition copied to DDR temporary location
		 */
		if (PLPartitionFlag) {
			LoadAddr = DDR_TEMP_START_ADDR;
		}

		Status = MoveImage(SourceAddr,
						LoadAddr,
						(ImageWordLen << WORD_LENGTH_SHIFT));
		if(Status != XST_SUCCESS) {
			fsbl_printf(DEBUG_GENERAL, "Move Image Failed\r\n");
			return XST_FAILURE;
		}

		/*
		 * As image present at load address
		 */
		SourceAddr = LoadAddr;
	}

	if ((LinearBootDeviceFlag && PLPartitionFlag && SignedPartitionFlag) ||
				(LinearBootDeviceFlag && PSPartitionFlag) ||
				((!LinearBootDeviceFlag) && PSPartitionFlag && SecureTransferFlag)) {
		/*
		 * PL signed partition copied to DDR temporary location
		 * using non-secure PCAP for linear boot device
		 */
		if(PLPartitionFlag){
			SecureTransferFlag = 0;
			LoadAddr = DDR_TEMP_START_ADDR;
		}

		/*
		 * Data transfer using PCAP
		 */
		Status = PcapDataTransfer((u32*)SourceAddr,
						(u32*)LoadAddr,
						ImageWordLen,
						DataWordLen,
						SecureTransferFlag);
		if(Status != XST_SUCCESS) {
			fsbl_printf(DEBUG_GENERAL, "PCAP Data Transfer Failed\r\n");
			return XST_FAILURE;
		}

		/*
		 * As image present at load address
		 */
		SourceAddr = LoadAddr;
	}

	/*
	 * Load Bitstream partition in to fabric
	 */
	if(PLPartitionFlag) {
		Status = PcapLoadPartition((u32*)SourceAddr,
					(u32*)Header->LoadAddr,
					Header->ImageWordLen,
					Header->DataWordLen,
					EncryptedPartitionFlag);
		if(Status != XST_SUCCESS) {
			fsbl_printf(DEBUG_GENERAL, "PCAP Bitstream Download Failed\r\n");
			return XST_FAILURE;
		}
	}

	return XST_SUCCESS;
}


/******************************************************************************/
/**
*
* This function load the decrypts partition
*
* @param	StartAddr Source start address
* @param	DataLength Data length in words
* @param	ImageLength Image length in words
*
* @return
*		- XST_SUCCESS if decryption successful
*		- XST_FAILURE if decryption failed
*
* @note		None
*
*******************************************************************************/
u32 DecryptPartition(u32 StartAddr, u32 DataLength, u32 ImageLength)
{
	u32 Status;
	u8 SecureTransferFlag =1;

	/*
	 * Data transfer using PCAP
	 */
	Status = PcapDataTransfer((u32*)StartAddr,
					(u32*)StartAddr,
					ImageLength,
					DataLength,
					SecureTransferFlag);
	if (Status != XST_SUCCESS) {
		fsbl_printf(DEBUG_GENERAL,"PCAP Data Transfer failed \r\n");
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}
