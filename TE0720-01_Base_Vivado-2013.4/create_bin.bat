@set XILINX_DIR=C:\Xilinx\14.7\ISE_DS\

@set VIVADO_PRJ=base\base
@set FSBL_NAME=FSBL

@set PROJECT_DIR=%cd%
@set PROJECT_DIR=%PROJECT_DIR:~2%
@set PROJECT_DIR=%PROJECT_DIR:\=/%

@call %XILINX_DIR%settings64.bat
@copy %VIVADO_PRJ%.runs\impl_1\top.bit system.bit
@copy %VIVADO_PRJ%.sdk\SDK\SDK_Export\%FSBL_NAME%\Debug\%FSBL_NAME%.elf FSBL.elf

@echo "Create bif file"
@echo the_ROM_image: > bootimage.bif
@echo { >> bootimage.bif
@echo 	[bootloader]%PROJECT_DIR%/FSBL.elf >> bootimage.bif
@echo 	%PROJECT_DIR%/system.bit >> bootimage.bif
@echo 	%PROJECT_DIR%/u-boot.elf >> bootimage.bif
@echo } >> bootimage.bif

@bootgen -image bootimage.bif -o i boot.bin -w on 
@del bootimage.bif
