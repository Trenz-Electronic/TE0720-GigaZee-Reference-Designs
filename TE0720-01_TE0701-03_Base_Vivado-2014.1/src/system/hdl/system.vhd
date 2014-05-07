--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.1 (win64) Build 881834 Fri Apr  4 14:15:54 MDT 2014
--Date        : Wed May 07 12:54:05 2014
--Host        : W7-64-02 running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target system.bd
--Design      : system
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity I2C1_imp_1LDKQRH is
  port (
    GPIO_O : in STD_LOGIC_VECTOR ( 0 to 0 );
    SCL_I : out STD_LOGIC;
    SCL_O : in STD_LOGIC_VECTOR ( 0 to 0 );
    SCL_T : in STD_LOGIC_VECTOR ( 0 to 0 );
    SDA_I : out STD_LOGIC;
    SDA_O : in STD_LOGIC_VECTOR ( 0 to 0 );
    SDA_T : in STD_LOGIC_VECTOR ( 0 to 0 );
    cpld_x0 : out STD_LOGIC;
    cpld_x1 : out STD_LOGIC;
    cpld_x5 : in STD_LOGIC;
    cpld_x7 : out STD_LOGIC
  );
end I2C1_imp_1LDKQRH;

architecture STRUCTURE of I2C1_imp_1LDKQRH is
  component system_util_reduced_logic_0_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 1 );
    Res : out STD_LOGIC
  );
  end component system_util_reduced_logic_0_0;
  component system_util_reduced_logic_0_1 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 1 );
    Res : out STD_LOGIC
  );
  end component system_util_reduced_logic_0_1;
  component system_util_vector_logic_0_1 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component system_util_vector_logic_0_1;
  component system_xlconcat_0_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component system_xlconcat_0_0;
  component system_xlconcat_0_1 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component system_xlconcat_0_1;
  component system_util_reduced_logic_0_2 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC
  );
  end component system_util_reduced_logic_0_2;
  signal In0_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal In0_2 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal In1_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal In1_2 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Op1_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal cpld_x5_1 : STD_LOGIC;
  signal not_0_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal or_0_Res : STD_LOGIC;
  signal or_1_Res : STD_LOGIC;
  signal or_2_Res : STD_LOGIC;
  signal xlconcat_0_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xlconcat_1_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
begin
  In0_1(0) <= SCL_O(0);
  In0_2(0) <= SDA_O(0);
  In1_1(0) <= SCL_T(0);
  In1_2(0) <= SDA_T(0);
  Op1_1(0) <= GPIO_O(0);
  SCL_I <= or_0_Res;
  SDA_I <= cpld_x5_1;
  cpld_x0 <= or_2_Res;
  cpld_x1 <= or_0_Res;
  cpld_x5_1 <= cpld_x5;
  cpld_x7 <= or_1_Res;
not_0: component system_util_vector_logic_0_1
    port map (
      Op1(0) => Op1_1(0),
      Res(0) => not_0_Res(0)
    );
or_0: component system_util_reduced_logic_0_0
    port map (
      Op1(0) => xlconcat_1_dout(1),
      Op1(1) => xlconcat_1_dout(0),
      Res => or_0_Res
    );
or_1: component system_util_reduced_logic_0_1
    port map (
      Op1(0) => xlconcat_0_dout(1),
      Op1(1) => xlconcat_0_dout(0),
      Res => or_1_Res
    );
or_2: component system_util_reduced_logic_0_2
    port map (
      Op1(0) => not_0_Res(0),
      Res => or_2_Res
    );
xlconcat_0: component system_xlconcat_0_0
    port map (
      In0(0) => In0_2(0),
      In1(0) => In1_2(0),
      dout(1 downto 0) => xlconcat_0_dout(1 downto 0)
    );
xlconcat_1: component system_xlconcat_0_1
    port map (
      In0(0) => In0_1(0),
      In1(0) => In1_1(0),
      dout(1 downto 0) => xlconcat_1_dout(1 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Video_imp_GOF2WL is
  port (
    HDMI_CLK : out STD_LOGIC;
    HDMI_D : out STD_LOGIC_VECTOR ( 11 downto 0 );
    HDMI_DE : out STD_LOGIC;
    HDMI_HS : out STD_LOGIC;
    HDMI_VS : out STD_LOGIC;
    cec_clk : out STD_LOGIC_VECTOR ( 0 to 0 );
    ct_hpd : out STD_LOGIC_VECTOR ( 0 to 0 );
    ext_reset_in : in STD_LOGIC;
    ls_oe : out STD_LOGIC_VECTOR ( 0 to 0 );
    video_clk : in STD_LOGIC
  );
end Video_imp_GOF2WL;

architecture STRUCTURE of Video_imp_GOF2WL is
  component system_xlconstant_0_3 is
  port (
    const : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component system_xlconstant_0_3;
  component system_v_axi4s_vid_out_0_0 is
  port (
    aclk : in STD_LOGIC;
    rst : in STD_LOGIC;
    aclken : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_video_tdata : in STD_LOGIC_VECTOR ( 23 downto 0 );
    s_axis_video_tvalid : in STD_LOGIC;
    s_axis_video_tready : out STD_LOGIC;
    s_axis_video_tuser : in STD_LOGIC;
    s_axis_video_tlast : in STD_LOGIC;
    fid : in STD_LOGIC;
    vid_io_out_clk : in STD_LOGIC;
    vid_io_out_ce : in STD_LOGIC;
    vid_active_video : out STD_LOGIC;
    vid_vsync : out STD_LOGIC;
    vid_hsync : out STD_LOGIC;
    vid_vblank : out STD_LOGIC;
    vid_hblank : out STD_LOGIC;
    vid_field_id : out STD_LOGIC;
    vid_data : out STD_LOGIC_VECTOR ( 23 downto 0 );
    vtg_vsync : in STD_LOGIC;
    vtg_hsync : in STD_LOGIC;
    vtg_vblank : in STD_LOGIC;
    vtg_hblank : in STD_LOGIC;
    vtg_active_video : in STD_LOGIC;
    vtg_field_id : in STD_LOGIC;
    vtg_ce : out STD_LOGIC;
    locked : out STD_LOGIC;
    wr_error : out STD_LOGIC;
    empty : out STD_LOGIC
  );
  end component system_v_axi4s_vid_out_0_0;
  component system_xlconstant_0_4 is
  port (
    const : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component system_xlconstant_0_4;
  component system_proc_sys_reset_1_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component system_proc_sys_reset_1_0;
  component system_selectio_wiz_0_0 is
  port (
    data_out_to_pins : out STD_LOGIC_VECTOR ( 11 downto 0 );
    clk_in : in STD_LOGIC;
    data_out_from_device : in STD_LOGIC_VECTOR ( 23 downto 0 );
    io_reset : in STD_LOGIC
  );
  end component system_selectio_wiz_0_0;
  component system_v_tc_1_0 is
  port (
    clk : in STD_LOGIC;
    clken : in STD_LOGIC;
    gen_clken : in STD_LOGIC;
    hsync_out : out STD_LOGIC;
    hblank_out : out STD_LOGIC;
    vsync_out : out STD_LOGIC;
    vblank_out : out STD_LOGIC;
    active_video_out : out STD_LOGIC;
    resetn : in STD_LOGIC;
    fsync_out : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component system_v_tc_1_0;
  component system_v_tpg_0_0 is
  port (
    aclk : in STD_LOGIC;
    aclken : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_video_tdata : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axis_video_tvalid : out STD_LOGIC;
    m_axis_video_tready : in STD_LOGIC;
    m_axis_video_tlast : out STD_LOGIC;
    m_axis_video_tuser : out STD_LOGIC
  );
  end component system_v_tpg_0_0;
  signal GND_1 : STD_LOGIC;
  signal VCC_1 : STD_LOGIC;
  signal ext_reset_in1_1 : STD_LOGIC;
  signal net_gnd_0_const : STD_LOGIC_VECTOR ( 0 to 0 );
  signal net_vcc_0_const : STD_LOGIC_VECTOR ( 0 to 0 );
  signal proc_sys_reset_0_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal proc_sys_reset_1_peripheral_reset : STD_LOGIC_VECTOR ( 0 to 0 );
  signal selectio_wiz_0_data_out_to_pins : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal slowest_sync_clk_1 : STD_LOGIC;
  signal v_axi4s_vid_out_0_vid_active_video : STD_LOGIC;
  signal v_axi4s_vid_out_0_vid_data : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal v_axi4s_vid_out_0_vid_hsync : STD_LOGIC;
  signal v_axi4s_vid_out_0_vid_vsync : STD_LOGIC;
  signal v_axi4s_vid_out_0_vtg_ce : STD_LOGIC;
  signal v_tc_1_vtiming_out_ACTIVE_VIDEO : STD_LOGIC;
  signal v_tc_1_vtiming_out_HBLANK : STD_LOGIC;
  signal v_tc_1_vtiming_out_HSYNC : STD_LOGIC;
  signal v_tc_1_vtiming_out_VBLANK : STD_LOGIC;
  signal v_tc_1_vtiming_out_VSYNC : STD_LOGIC;
  signal v_tpg_0_video_out_TDATA : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal v_tpg_0_video_out_TLAST : STD_LOGIC;
  signal v_tpg_0_video_out_TREADY : STD_LOGIC;
  signal v_tpg_0_video_out_TUSER : STD_LOGIC;
  signal v_tpg_0_video_out_TVALID : STD_LOGIC;
  signal NLW_proc_sys_reset_1_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_proc_sys_reset_1_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_1_interconnect_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_v_axi4s_vid_out_0_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_v_axi4s_vid_out_0_locked_UNCONNECTED : STD_LOGIC;
  signal NLW_v_axi4s_vid_out_0_vid_field_id_UNCONNECTED : STD_LOGIC;
  signal NLW_v_axi4s_vid_out_0_vid_hblank_UNCONNECTED : STD_LOGIC;
  signal NLW_v_axi4s_vid_out_0_vid_vblank_UNCONNECTED : STD_LOGIC;
  signal NLW_v_axi4s_vid_out_0_wr_error_UNCONNECTED : STD_LOGIC;
  signal NLW_v_tc_1_fsync_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  HDMI_CLK <= slowest_sync_clk_1;
  HDMI_D(11 downto 0) <= selectio_wiz_0_data_out_to_pins(11 downto 0);
  HDMI_DE <= v_axi4s_vid_out_0_vid_active_video;
  HDMI_HS <= v_axi4s_vid_out_0_vid_hsync;
  HDMI_VS <= v_axi4s_vid_out_0_vid_vsync;
  cec_clk(0) <= net_gnd_0_const(0);
  ct_hpd(0) <= net_vcc_0_const(0);
  ext_reset_in1_1 <= ext_reset_in;
  ls_oe(0) <= net_vcc_0_const(0);
  slowest_sync_clk_1 <= video_clk;
GND: unisim.vcomponents.GND
    port map (
      G => GND_1
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => VCC_1
    );
net_gnd_0: component system_xlconstant_0_4
    port map (
      const(0) => net_gnd_0_const(0)
    );
net_vcc_0: component system_xlconstant_0_3
    port map (
      const(0) => net_vcc_0_const(0)
    );
proc_sys_reset_1: component system_proc_sys_reset_1_0
    port map (
      aux_reset_in => VCC_1,
      bus_struct_reset(0) => NLW_proc_sys_reset_1_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => VCC_1,
      ext_reset_in => ext_reset_in1_1,
      interconnect_aresetn(0) => NLW_proc_sys_reset_1_interconnect_aresetn_UNCONNECTED(0),
      mb_debug_sys_rst => GND_1,
      mb_reset => NLW_proc_sys_reset_1_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => proc_sys_reset_0_peripheral_aresetn(0),
      peripheral_reset(0) => proc_sys_reset_1_peripheral_reset(0),
      slowest_sync_clk => slowest_sync_clk_1
    );
selectio_wiz_0: component system_selectio_wiz_0_0
    port map (
      clk_in => slowest_sync_clk_1,
      data_out_from_device(23 downto 0) => v_axi4s_vid_out_0_vid_data(23 downto 0),
      data_out_to_pins(11 downto 0) => selectio_wiz_0_data_out_to_pins(11 downto 0),
      io_reset => proc_sys_reset_1_peripheral_reset(0)
    );
v_axi4s_vid_out_0: component system_v_axi4s_vid_out_0_0
    port map (
      aclk => slowest_sync_clk_1,
      aclken => net_vcc_0_const(0),
      aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      empty => NLW_v_axi4s_vid_out_0_empty_UNCONNECTED,
      fid => net_gnd_0_const(0),
      locked => NLW_v_axi4s_vid_out_0_locked_UNCONNECTED,
      rst => proc_sys_reset_1_peripheral_reset(0),
      s_axis_video_tdata(23 downto 0) => v_tpg_0_video_out_TDATA(23 downto 0),
      s_axis_video_tlast => v_tpg_0_video_out_TLAST,
      s_axis_video_tready => v_tpg_0_video_out_TREADY,
      s_axis_video_tuser => v_tpg_0_video_out_TUSER,
      s_axis_video_tvalid => v_tpg_0_video_out_TVALID,
      vid_active_video => v_axi4s_vid_out_0_vid_active_video,
      vid_data(23 downto 0) => v_axi4s_vid_out_0_vid_data(23 downto 0),
      vid_field_id => NLW_v_axi4s_vid_out_0_vid_field_id_UNCONNECTED,
      vid_hblank => NLW_v_axi4s_vid_out_0_vid_hblank_UNCONNECTED,
      vid_hsync => v_axi4s_vid_out_0_vid_hsync,
      vid_io_out_ce => net_vcc_0_const(0),
      vid_io_out_clk => slowest_sync_clk_1,
      vid_vblank => NLW_v_axi4s_vid_out_0_vid_vblank_UNCONNECTED,
      vid_vsync => v_axi4s_vid_out_0_vid_vsync,
      vtg_active_video => v_tc_1_vtiming_out_ACTIVE_VIDEO,
      vtg_ce => v_axi4s_vid_out_0_vtg_ce,
      vtg_field_id => GND_1,
      vtg_hblank => v_tc_1_vtiming_out_HBLANK,
      vtg_hsync => v_tc_1_vtiming_out_HSYNC,
      vtg_vblank => v_tc_1_vtiming_out_VBLANK,
      vtg_vsync => v_tc_1_vtiming_out_VSYNC,
      wr_error => NLW_v_axi4s_vid_out_0_wr_error_UNCONNECTED
    );
v_tc_1: component system_v_tc_1_0
    port map (
      active_video_out => v_tc_1_vtiming_out_ACTIVE_VIDEO,
      clk => slowest_sync_clk_1,
      clken => net_vcc_0_const(0),
      fsync_out(0) => NLW_v_tc_1_fsync_out_UNCONNECTED(0),
      gen_clken => v_axi4s_vid_out_0_vtg_ce,
      hblank_out => v_tc_1_vtiming_out_HBLANK,
      hsync_out => v_tc_1_vtiming_out_HSYNC,
      resetn => proc_sys_reset_0_peripheral_aresetn(0),
      vblank_out => v_tc_1_vtiming_out_VBLANK,
      vsync_out => v_tc_1_vtiming_out_VSYNC
    );
v_tpg_0: component system_v_tpg_0_0
    port map (
      aclk => slowest_sync_clk_1,
      aclken => net_vcc_0_const(0),
      aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      m_axis_video_tdata(23 downto 0) => v_tpg_0_video_out_TDATA(23 downto 0),
      m_axis_video_tlast => v_tpg_0_video_out_TLAST,
      m_axis_video_tready => v_tpg_0_video_out_TREADY,
      m_axis_video_tuser => v_tpg_0_video_out_TUSER,
      m_axis_video_tvalid => v_tpg_0_video_out_TVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system is
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
    HDMI_scl_i : in STD_LOGIC;
    HDMI_scl_o : out STD_LOGIC;
    HDMI_scl_t : out STD_LOGIC;
    HDMI_sda_i : in STD_LOGIC;
    HDMI_sda_o : out STD_LOGIC;
    HDMI_sda_t : out STD_LOGIC;
    cec_clk : out STD_LOGIC_VECTOR ( 0 to 0 );
    cpld_x0 : out STD_LOGIC;
    cpld_x1 : out STD_LOGIC;
    cpld_x5 : in STD_LOGIC;
    cpld_x7 : out STD_LOGIC;
    ct_hpd : out STD_LOGIC_VECTOR ( 0 to 0 );
    ls_oe : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of system : entity is "system,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLanguage=VHDL,numBlks=17,numReposBlks=15,numNonXlnxBlks=0,numHierBlks=2,maxHierDepth=1,da_axi4_cnt=4,da_board_cnt=3,da_ps7_cnt=1}";
end system;

architecture STRUCTURE of system is
  component system_processing_system7_0_0 is
  port (
    GPIO_I : in STD_LOGIC_VECTOR ( 0 to 0 );
    GPIO_O : out STD_LOGIC_VECTOR ( 0 to 0 );
    GPIO_T : out STD_LOGIC_VECTOR ( 0 to 0 );
    I2C0_SDA_I : in STD_LOGIC;
    I2C0_SDA_O : out STD_LOGIC;
    I2C0_SDA_T : out STD_LOGIC;
    I2C0_SCL_I : in STD_LOGIC;
    I2C0_SCL_O : out STD_LOGIC;
    I2C0_SCL_T : out STD_LOGIC;
    I2C1_SDA_I : in STD_LOGIC;
    I2C1_SDA_O : out STD_LOGIC;
    I2C1_SDA_T : out STD_LOGIC;
    I2C1_SCL_I : in STD_LOGIC;
    I2C1_SCL_O : out STD_LOGIC;
    I2C1_SCL_T : out STD_LOGIC;
    SDIO0_CDN : in STD_LOGIC;
    SDIO1_CDN : in STD_LOGIC;
    TTC0_WAVE0_OUT : out STD_LOGIC;
    TTC0_WAVE1_OUT : out STD_LOGIC;
    TTC0_WAVE2_OUT : out STD_LOGIC;
    USB0_PORT_INDCTL : out STD_LOGIC_VECTOR ( 1 downto 0 );
    USB0_VBUS_PWRSELECT : out STD_LOGIC;
    USB0_VBUS_PWRFAULT : in STD_LOGIC;
    M_AXI_GP0_ARVALID : out STD_LOGIC;
    M_AXI_GP0_AWVALID : out STD_LOGIC;
    M_AXI_GP0_BREADY : out STD_LOGIC;
    M_AXI_GP0_RREADY : out STD_LOGIC;
    M_AXI_GP0_WLAST : out STD_LOGIC;
    M_AXI_GP0_WVALID : out STD_LOGIC;
    M_AXI_GP0_ARID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_AWID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_WID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ACLK : in STD_LOGIC;
    M_AXI_GP0_ARREADY : in STD_LOGIC;
    M_AXI_GP0_AWREADY : in STD_LOGIC;
    M_AXI_GP0_BVALID : in STD_LOGIC;
    M_AXI_GP0_RLAST : in STD_LOGIC;
    M_AXI_GP0_RVALID : in STD_LOGIC;
    M_AXI_GP0_WREADY : in STD_LOGIC;
    M_AXI_GP0_BID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_RID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FCLK_CLK0 : out STD_LOGIC;
    FCLK_CLK1 : out STD_LOGIC;
    FCLK_CLK2 : out STD_LOGIC;
    FCLK_CLK3 : out STD_LOGIC;
    FCLK_RESET0_N : out STD_LOGIC;
    MIO : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    DDR_CAS_n : inout STD_LOGIC;
    DDR_CKE : inout STD_LOGIC;
    DDR_Clk_n : inout STD_LOGIC;
    DDR_Clk : inout STD_LOGIC;
    DDR_CS_n : inout STD_LOGIC;
    DDR_DRSTB : inout STD_LOGIC;
    DDR_ODT : inout STD_LOGIC;
    DDR_RAS_n : inout STD_LOGIC;
    DDR_WEB : inout STD_LOGIC;
    DDR_BankAddr : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_Addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_VRN : inout STD_LOGIC;
    DDR_VRP : inout STD_LOGIC;
    DDR_DM : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQ : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_DQS_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQS : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    PS_SRSTB : inout STD_LOGIC;
    PS_CLK : inout STD_LOGIC;
    PS_PORB : inout STD_LOGIC
  );
  end component system_processing_system7_0_0;
  component system_xlconstant_0_0 is
  port (
    const : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component system_xlconstant_0_0;
  signal GND_1 : STD_LOGIC;
  signal I2C1_Res1 : STD_LOGIC;
  signal I2C1_Res2 : STD_LOGIC;
  signal I2C1_SCL_I : STD_LOGIC;
  signal I2C1_SDA_I : STD_LOGIC;
  signal I2C1_cpld_x0 : STD_LOGIC;
  signal Video_HDMI_CLK : STD_LOGIC;
  signal Video_HDMI_D : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal Video_HDMI_DE : STD_LOGIC;
  signal Video_HDMI_HS : STD_LOGIC;
  signal Video_HDMI_VS : STD_LOGIC;
  signal Video_cec_clk : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Video_ct_hpd : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Video_ls_oe : STD_LOGIC_VECTOR ( 0 to 0 );
  signal cpld_x5_1 : STD_LOGIC;
  signal net_gnd_const : STD_LOGIC_VECTOR ( 0 to 0 );
  signal processing_system7_0_DDR_ADDR : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal processing_system7_0_DDR_BA : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_DDR_CAS_N : STD_LOGIC;
  signal processing_system7_0_DDR_CKE : STD_LOGIC;
  signal processing_system7_0_DDR_CK_N : STD_LOGIC;
  signal processing_system7_0_DDR_CK_P : STD_LOGIC;
  signal processing_system7_0_DDR_CS_N : STD_LOGIC;
  signal processing_system7_0_DDR_DM : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_DQ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_DDR_DQS_N : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_DQS_P : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_ODT : STD_LOGIC;
  signal processing_system7_0_DDR_RAS_N : STD_LOGIC;
  signal processing_system7_0_DDR_RESET_N : STD_LOGIC;
  signal processing_system7_0_DDR_WE_N : STD_LOGIC;
  signal processing_system7_0_FCLK_CLK0 : STD_LOGIC;
  signal processing_system7_0_FCLK_CLK3 : STD_LOGIC;
  signal processing_system7_0_FCLK_RESET0_N : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_DDR_VRN : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_DDR_VRP : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_MIO : STD_LOGIC_VECTOR ( 53 downto 0 );
  signal processing_system7_0_FIXED_IO_PS_CLK : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_PS_PORB : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_PS_SRSTB : STD_LOGIC;
  signal processing_system7_0_GPIO_O : STD_LOGIC_VECTOR ( 0 to 0 );
  signal processing_system7_0_I2C1_SCL_O : STD_LOGIC;
  signal processing_system7_0_I2C1_SCL_T : STD_LOGIC;
  signal processing_system7_0_I2C1_SDA_O : STD_LOGIC;
  signal processing_system7_0_I2C1_SDA_T : STD_LOGIC;
  signal processing_system7_0_IIC_0_SCL_I : STD_LOGIC;
  signal processing_system7_0_IIC_0_SCL_O : STD_LOGIC;
  signal processing_system7_0_IIC_0_SCL_T : STD_LOGIC;
  signal processing_system7_0_IIC_0_SDA_I : STD_LOGIC;
  signal processing_system7_0_IIC_0_SDA_O : STD_LOGIC;
  signal processing_system7_0_IIC_0_SDA_T : STD_LOGIC;
  signal NLW_processing_system7_0_FCLK_CLK1_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_FCLK_CLK2_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_M_AXI_GP0_ARVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_M_AXI_GP0_AWVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_M_AXI_GP0_BREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_M_AXI_GP0_RREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_M_AXI_GP0_WLAST_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_M_AXI_GP0_WVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_TTC0_WAVE0_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_TTC0_WAVE1_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_TTC0_WAVE2_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_USB0_VBUS_PWRSELECT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_GPIO_T_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_ARADDR_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_ARBURST_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_ARCACHE_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_ARID_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_ARLEN_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_ARLOCK_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_ARPROT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_ARQOS_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_ARSIZE_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_AWADDR_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_AWBURST_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_AWCACHE_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_AWID_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_AWLEN_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_AWLOCK_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_AWPROT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_AWQOS_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_AWSIZE_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_WDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_WID_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_WSTRB_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_processing_system7_0_USB0_PORT_INDCTL_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
begin
  HDMI_CLK <= Video_HDMI_CLK;
  HDMI_D(11 downto 0) <= Video_HDMI_D(11 downto 0);
  HDMI_DE <= Video_HDMI_DE;
  HDMI_HS <= Video_HDMI_HS;
  HDMI_VS <= Video_HDMI_VS;
  HDMI_scl_o <= processing_system7_0_IIC_0_SCL_O;
  HDMI_scl_t <= processing_system7_0_IIC_0_SCL_T;
  HDMI_sda_o <= processing_system7_0_IIC_0_SDA_O;
  HDMI_sda_t <= processing_system7_0_IIC_0_SDA_T;
  cec_clk(0) <= Video_cec_clk(0);
  cpld_x0 <= I2C1_cpld_x0;
  cpld_x1 <= I2C1_Res1;
  cpld_x5_1 <= cpld_x5;
  cpld_x7 <= I2C1_Res2;
  ct_hpd(0) <= Video_ct_hpd(0);
  ls_oe(0) <= Video_ls_oe(0);
  processing_system7_0_IIC_0_SCL_I <= HDMI_scl_i;
  processing_system7_0_IIC_0_SDA_I <= HDMI_sda_i;
GND: unisim.vcomponents.GND
    port map (
      G => GND_1
    );
I2C1: entity work.I2C1_imp_1LDKQRH
    port map (
      GPIO_O(0) => processing_system7_0_GPIO_O(0),
      SCL_I => I2C1_SCL_I,
      SCL_O(0) => processing_system7_0_I2C1_SCL_O,
      SCL_T(0) => processing_system7_0_I2C1_SCL_T,
      SDA_I => I2C1_SDA_I,
      SDA_O(0) => processing_system7_0_I2C1_SDA_O,
      SDA_T(0) => processing_system7_0_I2C1_SDA_T,
      cpld_x0 => I2C1_cpld_x0,
      cpld_x1 => I2C1_Res1,
      cpld_x5 => cpld_x5_1,
      cpld_x7 => I2C1_Res2
    );
Video: entity work.Video_imp_GOF2WL
    port map (
      HDMI_CLK => Video_HDMI_CLK,
      HDMI_D(11 downto 0) => Video_HDMI_D(11 downto 0),
      HDMI_DE => Video_HDMI_DE,
      HDMI_HS => Video_HDMI_HS,
      HDMI_VS => Video_HDMI_VS,
      cec_clk(0) => Video_cec_clk(0),
      ct_hpd(0) => Video_ct_hpd(0),
      ext_reset_in => processing_system7_0_FCLK_RESET0_N,
      ls_oe(0) => Video_ls_oe(0),
      video_clk => processing_system7_0_FCLK_CLK3
    );
net_gnd: component system_xlconstant_0_0
    port map (
      const(0) => net_gnd_const(0)
    );
processing_system7_0: component system_processing_system7_0_0
    port map (
      DDR_Addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_BankAddr(2 downto 0) => DDR_ba(2 downto 0),
      DDR_CAS_n => DDR_cas_n,
      DDR_CKE => DDR_cke,
      DDR_CS_n => DDR_cs_n,
      DDR_Clk => DDR_ck_p,
      DDR_Clk_n => DDR_ck_n,
      DDR_DM(3 downto 0) => DDR_dm(3 downto 0),
      DDR_DQ(31 downto 0) => DDR_dq(31 downto 0),
      DDR_DQS(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_DQS_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_DRSTB => DDR_reset_n,
      DDR_ODT => DDR_odt,
      DDR_RAS_n => DDR_ras_n,
      DDR_VRN => FIXED_IO_ddr_vrn,
      DDR_VRP => FIXED_IO_ddr_vrp,
      DDR_WEB => DDR_we_n,
      FCLK_CLK0 => processing_system7_0_FCLK_CLK0,
      FCLK_CLK1 => NLW_processing_system7_0_FCLK_CLK1_UNCONNECTED,
      FCLK_CLK2 => NLW_processing_system7_0_FCLK_CLK2_UNCONNECTED,
      FCLK_CLK3 => processing_system7_0_FCLK_CLK3,
      FCLK_RESET0_N => processing_system7_0_FCLK_RESET0_N,
      GPIO_I(0) => GND_1,
      GPIO_O(0) => processing_system7_0_GPIO_O(0),
      GPIO_T(0) => NLW_processing_system7_0_GPIO_T_UNCONNECTED(0),
      I2C0_SCL_I => processing_system7_0_IIC_0_SCL_I,
      I2C0_SCL_O => processing_system7_0_IIC_0_SCL_O,
      I2C0_SCL_T => processing_system7_0_IIC_0_SCL_T,
      I2C0_SDA_I => processing_system7_0_IIC_0_SDA_I,
      I2C0_SDA_O => processing_system7_0_IIC_0_SDA_O,
      I2C0_SDA_T => processing_system7_0_IIC_0_SDA_T,
      I2C1_SCL_I => I2C1_SCL_I,
      I2C1_SCL_O => processing_system7_0_I2C1_SCL_O,
      I2C1_SCL_T => processing_system7_0_I2C1_SCL_T,
      I2C1_SDA_I => I2C1_SDA_I,
      I2C1_SDA_O => processing_system7_0_I2C1_SDA_O,
      I2C1_SDA_T => processing_system7_0_I2C1_SDA_T,
      MIO(53 downto 0) => FIXED_IO_mio(53 downto 0),
      M_AXI_GP0_ACLK => processing_system7_0_FCLK_CLK0,
      M_AXI_GP0_ARADDR(31 downto 0) => NLW_processing_system7_0_M_AXI_GP0_ARADDR_UNCONNECTED(31 downto 0),
      M_AXI_GP0_ARBURST(1 downto 0) => NLW_processing_system7_0_M_AXI_GP0_ARBURST_UNCONNECTED(1 downto 0),
      M_AXI_GP0_ARCACHE(3 downto 0) => NLW_processing_system7_0_M_AXI_GP0_ARCACHE_UNCONNECTED(3 downto 0),
      M_AXI_GP0_ARID(11 downto 0) => NLW_processing_system7_0_M_AXI_GP0_ARID_UNCONNECTED(11 downto 0),
      M_AXI_GP0_ARLEN(3 downto 0) => NLW_processing_system7_0_M_AXI_GP0_ARLEN_UNCONNECTED(3 downto 0),
      M_AXI_GP0_ARLOCK(1 downto 0) => NLW_processing_system7_0_M_AXI_GP0_ARLOCK_UNCONNECTED(1 downto 0),
      M_AXI_GP0_ARPROT(2 downto 0) => NLW_processing_system7_0_M_AXI_GP0_ARPROT_UNCONNECTED(2 downto 0),
      M_AXI_GP0_ARQOS(3 downto 0) => NLW_processing_system7_0_M_AXI_GP0_ARQOS_UNCONNECTED(3 downto 0),
      M_AXI_GP0_ARREADY => GND_1,
      M_AXI_GP0_ARSIZE(2 downto 0) => NLW_processing_system7_0_M_AXI_GP0_ARSIZE_UNCONNECTED(2 downto 0),
      M_AXI_GP0_ARVALID => NLW_processing_system7_0_M_AXI_GP0_ARVALID_UNCONNECTED,
      M_AXI_GP0_AWADDR(31 downto 0) => NLW_processing_system7_0_M_AXI_GP0_AWADDR_UNCONNECTED(31 downto 0),
      M_AXI_GP0_AWBURST(1 downto 0) => NLW_processing_system7_0_M_AXI_GP0_AWBURST_UNCONNECTED(1 downto 0),
      M_AXI_GP0_AWCACHE(3 downto 0) => NLW_processing_system7_0_M_AXI_GP0_AWCACHE_UNCONNECTED(3 downto 0),
      M_AXI_GP0_AWID(11 downto 0) => NLW_processing_system7_0_M_AXI_GP0_AWID_UNCONNECTED(11 downto 0),
      M_AXI_GP0_AWLEN(3 downto 0) => NLW_processing_system7_0_M_AXI_GP0_AWLEN_UNCONNECTED(3 downto 0),
      M_AXI_GP0_AWLOCK(1 downto 0) => NLW_processing_system7_0_M_AXI_GP0_AWLOCK_UNCONNECTED(1 downto 0),
      M_AXI_GP0_AWPROT(2 downto 0) => NLW_processing_system7_0_M_AXI_GP0_AWPROT_UNCONNECTED(2 downto 0),
      M_AXI_GP0_AWQOS(3 downto 0) => NLW_processing_system7_0_M_AXI_GP0_AWQOS_UNCONNECTED(3 downto 0),
      M_AXI_GP0_AWREADY => GND_1,
      M_AXI_GP0_AWSIZE(2 downto 0) => NLW_processing_system7_0_M_AXI_GP0_AWSIZE_UNCONNECTED(2 downto 0),
      M_AXI_GP0_AWVALID => NLW_processing_system7_0_M_AXI_GP0_AWVALID_UNCONNECTED,
      M_AXI_GP0_BID(11) => GND_1,
      M_AXI_GP0_BID(10) => GND_1,
      M_AXI_GP0_BID(9) => GND_1,
      M_AXI_GP0_BID(8) => GND_1,
      M_AXI_GP0_BID(7) => GND_1,
      M_AXI_GP0_BID(6) => GND_1,
      M_AXI_GP0_BID(5) => GND_1,
      M_AXI_GP0_BID(4) => GND_1,
      M_AXI_GP0_BID(3) => GND_1,
      M_AXI_GP0_BID(2) => GND_1,
      M_AXI_GP0_BID(1) => GND_1,
      M_AXI_GP0_BID(0) => GND_1,
      M_AXI_GP0_BREADY => NLW_processing_system7_0_M_AXI_GP0_BREADY_UNCONNECTED,
      M_AXI_GP0_BRESP(1) => GND_1,
      M_AXI_GP0_BRESP(0) => GND_1,
      M_AXI_GP0_BVALID => GND_1,
      M_AXI_GP0_RDATA(31) => GND_1,
      M_AXI_GP0_RDATA(30) => GND_1,
      M_AXI_GP0_RDATA(29) => GND_1,
      M_AXI_GP0_RDATA(28) => GND_1,
      M_AXI_GP0_RDATA(27) => GND_1,
      M_AXI_GP0_RDATA(26) => GND_1,
      M_AXI_GP0_RDATA(25) => GND_1,
      M_AXI_GP0_RDATA(24) => GND_1,
      M_AXI_GP0_RDATA(23) => GND_1,
      M_AXI_GP0_RDATA(22) => GND_1,
      M_AXI_GP0_RDATA(21) => GND_1,
      M_AXI_GP0_RDATA(20) => GND_1,
      M_AXI_GP0_RDATA(19) => GND_1,
      M_AXI_GP0_RDATA(18) => GND_1,
      M_AXI_GP0_RDATA(17) => GND_1,
      M_AXI_GP0_RDATA(16) => GND_1,
      M_AXI_GP0_RDATA(15) => GND_1,
      M_AXI_GP0_RDATA(14) => GND_1,
      M_AXI_GP0_RDATA(13) => GND_1,
      M_AXI_GP0_RDATA(12) => GND_1,
      M_AXI_GP0_RDATA(11) => GND_1,
      M_AXI_GP0_RDATA(10) => GND_1,
      M_AXI_GP0_RDATA(9) => GND_1,
      M_AXI_GP0_RDATA(8) => GND_1,
      M_AXI_GP0_RDATA(7) => GND_1,
      M_AXI_GP0_RDATA(6) => GND_1,
      M_AXI_GP0_RDATA(5) => GND_1,
      M_AXI_GP0_RDATA(4) => GND_1,
      M_AXI_GP0_RDATA(3) => GND_1,
      M_AXI_GP0_RDATA(2) => GND_1,
      M_AXI_GP0_RDATA(1) => GND_1,
      M_AXI_GP0_RDATA(0) => GND_1,
      M_AXI_GP0_RID(11) => GND_1,
      M_AXI_GP0_RID(10) => GND_1,
      M_AXI_GP0_RID(9) => GND_1,
      M_AXI_GP0_RID(8) => GND_1,
      M_AXI_GP0_RID(7) => GND_1,
      M_AXI_GP0_RID(6) => GND_1,
      M_AXI_GP0_RID(5) => GND_1,
      M_AXI_GP0_RID(4) => GND_1,
      M_AXI_GP0_RID(3) => GND_1,
      M_AXI_GP0_RID(2) => GND_1,
      M_AXI_GP0_RID(1) => GND_1,
      M_AXI_GP0_RID(0) => GND_1,
      M_AXI_GP0_RLAST => GND_1,
      M_AXI_GP0_RREADY => NLW_processing_system7_0_M_AXI_GP0_RREADY_UNCONNECTED,
      M_AXI_GP0_RRESP(1) => GND_1,
      M_AXI_GP0_RRESP(0) => GND_1,
      M_AXI_GP0_RVALID => GND_1,
      M_AXI_GP0_WDATA(31 downto 0) => NLW_processing_system7_0_M_AXI_GP0_WDATA_UNCONNECTED(31 downto 0),
      M_AXI_GP0_WID(11 downto 0) => NLW_processing_system7_0_M_AXI_GP0_WID_UNCONNECTED(11 downto 0),
      M_AXI_GP0_WLAST => NLW_processing_system7_0_M_AXI_GP0_WLAST_UNCONNECTED,
      M_AXI_GP0_WREADY => GND_1,
      M_AXI_GP0_WSTRB(3 downto 0) => NLW_processing_system7_0_M_AXI_GP0_WSTRB_UNCONNECTED(3 downto 0),
      M_AXI_GP0_WVALID => NLW_processing_system7_0_M_AXI_GP0_WVALID_UNCONNECTED,
      PS_CLK => FIXED_IO_ps_clk,
      PS_PORB => FIXED_IO_ps_porb,
      PS_SRSTB => FIXED_IO_ps_srstb,
      SDIO0_CDN => net_gnd_const(0),
      SDIO1_CDN => net_gnd_const(0),
      TTC0_WAVE0_OUT => NLW_processing_system7_0_TTC0_WAVE0_OUT_UNCONNECTED,
      TTC0_WAVE1_OUT => NLW_processing_system7_0_TTC0_WAVE1_OUT_UNCONNECTED,
      TTC0_WAVE2_OUT => NLW_processing_system7_0_TTC0_WAVE2_OUT_UNCONNECTED,
      USB0_PORT_INDCTL(1 downto 0) => NLW_processing_system7_0_USB0_PORT_INDCTL_UNCONNECTED(1 downto 0),
      USB0_VBUS_PWRFAULT => GND_1,
      USB0_VBUS_PWRSELECT => NLW_processing_system7_0_USB0_VBUS_PWRSELECT_UNCONNECTED
    );
end STRUCTURE;
