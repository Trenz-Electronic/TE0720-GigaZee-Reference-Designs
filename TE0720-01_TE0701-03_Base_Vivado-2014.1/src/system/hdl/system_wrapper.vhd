--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.1 (win64) Build 881834 Fri Apr  4 14:15:54 MDT 2014
--Date        : Wed May 07 12:54:05 2014
--Host        : W7-64-02 running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target system_wrapper.bd
--Design      : system_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_wrapper is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    HDMI_CLK : out STD_LOGIC;
    HDMI_D : out STD_LOGIC_VECTOR ( 11 downto 0 );
    HDMI_DE : out STD_LOGIC;
    HDMI_HS : out STD_LOGIC;
    HDMI_VS : out STD_LOGIC;
    cec_clk : out STD_LOGIC_VECTOR ( 0 to 0 );
    cpld_x0 : out STD_LOGIC;
    cpld_x1 : out STD_LOGIC;
    cpld_x5 : in STD_LOGIC;
    cpld_x7 : out STD_LOGIC;
    ct_hpd : out STD_LOGIC_VECTOR ( 0 to 0 );
    hdmi_scl_io : inout STD_LOGIC;
    hdmi_sda_io : inout STD_LOGIC;
    ls_oe : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
end system_wrapper;

architecture STRUCTURE of system_wrapper is
  component system is
  port (
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    HDMI_sda_i : in STD_LOGIC;
    HDMI_sda_o : out STD_LOGIC;
    HDMI_sda_t : out STD_LOGIC;
    HDMI_scl_i : in STD_LOGIC;
    HDMI_scl_o : out STD_LOGIC;
    HDMI_scl_t : out STD_LOGIC;
    cpld_x1 : out STD_LOGIC;
    cpld_x7 : out STD_LOGIC;
    cpld_x5 : in STD_LOGIC;
    cpld_x0 : out STD_LOGIC;
    HDMI_CLK : out STD_LOGIC;
    HDMI_D : out STD_LOGIC_VECTOR ( 11 downto 0 );
    cec_clk : out STD_LOGIC_VECTOR ( 0 to 0 );
    ct_hpd : out STD_LOGIC_VECTOR ( 0 to 0 );
    ls_oe : out STD_LOGIC_VECTOR ( 0 to 0 );
    HDMI_DE : out STD_LOGIC;
    HDMI_VS : out STD_LOGIC;
    HDMI_HS : out STD_LOGIC
  );
  end component system;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal hdmi_scl_i : STD_LOGIC;
  signal hdmi_scl_o : STD_LOGIC;
  signal hdmi_scl_t : STD_LOGIC;
  signal hdmi_sda_i : STD_LOGIC;
  signal hdmi_sda_o : STD_LOGIC;
  signal hdmi_sda_t : STD_LOGIC;
begin
hdmi_scl_iobuf: component IOBUF
    port map (
      I => hdmi_scl_o,
      IO => hdmi_scl_io,
      O => hdmi_scl_i,
      T => hdmi_scl_t
    );
hdmi_sda_iobuf: component IOBUF
    port map (
      I => hdmi_sda_o,
      IO => hdmi_sda_io,
      O => hdmi_sda_i,
      T => hdmi_sda_t
    );
system_i: component system
    port map (
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      HDMI_CLK => HDMI_CLK,
      HDMI_D(11 downto 0) => HDMI_D(11 downto 0),
      HDMI_DE => HDMI_DE,
      HDMI_HS => HDMI_HS,
      HDMI_VS => HDMI_VS,
      HDMI_scl_i => hdmi_scl_i,
      HDMI_scl_o => hdmi_scl_o,
      HDMI_scl_t => hdmi_scl_t,
      HDMI_sda_i => hdmi_sda_i,
      HDMI_sda_o => hdmi_sda_o,
      HDMI_sda_t => hdmi_sda_t,
      cec_clk(0) => cec_clk(0),
      cpld_x0 => cpld_x0,
      cpld_x1 => cpld_x1,
      cpld_x5 => cpld_x5,
      cpld_x7 => cpld_x7,
      ct_hpd(0) => ct_hpd(0),
      ls_oe(0) => ls_oe(0)
    );
end STRUCTURE;
