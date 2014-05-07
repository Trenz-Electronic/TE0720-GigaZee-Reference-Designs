-- (c) Copyright 1995-2014 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:ip:xlconcat:2.0
-- IP Revision: -1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY work;
USE work.xlconcat;

ENTITY system_xlconcat_0_1 IS
  PORT (
    In0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    In1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    dout : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END system_xlconcat_0_1;

ARCHITECTURE system_xlconcat_0_1_arch OF system_xlconcat_0_1 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : string;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF system_xlconcat_0_1_arch: ARCHITECTURE IS "yes";

  COMPONENT xlconcat IS
    GENERIC (
      NUM_PORTS : INTEGER;
      IN0_WIDTH : INTEGER;
      IN1_WIDTH : INTEGER;
      IN2_WIDTH : INTEGER;
      IN3_WIDTH : INTEGER;
      IN4_WIDTH : INTEGER;
      IN5_WIDTH : INTEGER;
      IN6_WIDTH : INTEGER;
      IN7_WIDTH : INTEGER;
      IN8_WIDTH : INTEGER;
      IN9_WIDTH : INTEGER;
      IN10_WIDTH : INTEGER;
      IN11_WIDTH : INTEGER;
      IN12_WIDTH : INTEGER;
      IN13_WIDTH : INTEGER;
      IN14_WIDTH : INTEGER;
      IN15_WIDTH : INTEGER;
      dout_width : INTEGER
    );
    PORT (
      In0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      In1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      In2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      In3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      In4 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      In5 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      In6 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      In7 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      In8 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      In9 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      In10 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      In11 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      In12 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      In13 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      In14 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      In15 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      dout : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
    );
  END COMPONENT xlconcat;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF system_xlconcat_0_1_arch: ARCHITECTURE IS "xlconcat,Vivado 2014.1";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF system_xlconcat_0_1_arch : ARCHITECTURE IS "system_xlconcat_0_1,xlconcat,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF system_xlconcat_0_1_arch: ARCHITECTURE IS "system_xlconcat_0_1,xlconcat,{x_ipProduct=Vivado 2014.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=xlconcat,x_ipVersion=2.0,x_ipCoreRevision=-1,x_ipLanguage=VHDL,NUM_PORTS=2,IN0_WIDTH=1,IN1_WIDTH=1,IN2_WIDTH=1,IN3_WIDTH=1,IN4_WIDTH=1,IN5_WIDTH=1,IN6_WIDTH=1,IN7_WIDTH=1,IN8_WIDTH=1,IN9_WIDTH=1,IN10_WIDTH=1,IN11_WIDTH=1,IN12_WIDTH=1,IN13_WIDTH=1,IN14_WIDTH=1,IN15_WIDTH=1,dout_width=2}";
BEGIN
  U0 : xlconcat
    GENERIC MAP (
      NUM_PORTS => 2,
      IN0_WIDTH => 1,
      IN1_WIDTH => 1,
      IN2_WIDTH => 1,
      IN3_WIDTH => 1,
      IN4_WIDTH => 1,
      IN5_WIDTH => 1,
      IN6_WIDTH => 1,
      IN7_WIDTH => 1,
      IN8_WIDTH => 1,
      IN9_WIDTH => 1,
      IN10_WIDTH => 1,
      IN11_WIDTH => 1,
      IN12_WIDTH => 1,
      IN13_WIDTH => 1,
      IN14_WIDTH => 1,
      IN15_WIDTH => 1,
      dout_width => 2
    )
    PORT MAP (
      In0 => In0,
      In1 => In1,
      In2 => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      In3 => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      In4 => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      In5 => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      In6 => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      In7 => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      In8 => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      In9 => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      In10 => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      In11 => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      In12 => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      In13 => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      In14 => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      In15 => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      dout => dout
    );
END system_xlconcat_0_1_arch;
