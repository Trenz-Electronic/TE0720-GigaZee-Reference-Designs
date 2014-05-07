Base project for TE0720-01 on TE0701-03 with HDMI output Vivado 2014.1

Project build:
1. In Vivado TCL console run "cd project_location_path" (project_location_path should be replaced by real project location)
2. In Vivado TCL console run "source create.tcl"
3. In created project "Sources" tab click "top -> zynq_sys_i -> system" to open block design
4. Click "Generate Bitstream" in "Flow Navigator" tab
5. Click "Open Implemented Design"
6. Click "File -> Export -> Export Hardware for SDK..."
7. Select all checkboxes and click "OK"
8. In SDK window click "File -> New -> Application Project"
9. Select "FSBL" as project name and click "Next >"
10. Select "Zynq FSBL" as project template and click "Finish"
11. Select project in "Project Explorer" tab and click "Xilinx Tools -> Create Zynq Boot Image"
12. Click "Add"
13. Click "Browse" and navigate to src\u-boot.elf file in project directory
14. Click "Open"
15. Click "OK"
16. Click "Create Image". BOOT.bin file should be created in base\base.sdk\SDK\SDK_Export\FSBL\bootimage\