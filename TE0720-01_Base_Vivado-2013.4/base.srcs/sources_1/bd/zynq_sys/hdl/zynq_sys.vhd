library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity zynq_sys is
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
    GPIO_O : out STD_LOGIC_VECTOR ( 31 downto 0 );
    I2C1_SCL_I : in STD_LOGIC;
    I2C1_SCL_O : out STD_LOGIC;
    I2C1_SCL_T : out STD_LOGIC;
    I2C1_SDA_I : in STD_LOGIC;
    I2C1_SDA_O : out STD_LOGIC;
    I2C1_SDA_T : out STD_LOGIC;
    IIC_0_scl_i : in STD_LOGIC;
    IIC_0_scl_o : out STD_LOGIC;
    IIC_0_scl_t : out STD_LOGIC;
    IIC_0_sda_i : in STD_LOGIC;
    IIC_0_sda_o : out STD_LOGIC;
    IIC_0_sda_t : out STD_LOGIC;
    clk_100mhz : out STD_LOGIC;
    clk_200mhz : out STD_LOGIC;
    resetn : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of zynq_sys : entity is "zynq_sys,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLanguage=VHDL,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,da_ps7_cnt=1}";
end zynq_sys;

architecture STRUCTURE of zynq_sys is
  component zynq_sys_processing_system7_0_0 is
  port (
    GPIO_I : in STD_LOGIC_VECTOR ( 31 downto 0 );
    GPIO_O : out STD_LOGIC_VECTOR ( 31 downto 0 );
    GPIO_T : out STD_LOGIC_VECTOR ( 31 downto 0 );
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
    TTC0_CLK0_IN : in STD_LOGIC;
    TTC0_CLK1_IN : in STD_LOGIC;
    TTC0_CLK2_IN : in STD_LOGIC;
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
  end component zynq_sys_processing_system7_0_0;
  component zynq_sys_xlconstant_0_0 is
  port (
    const : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component zynq_sys_xlconstant_0_0;
  signal GND_1 : STD_LOGIC;
  signal i2c1_scl_i_1 : STD_LOGIC;
  signal i2c1_sda_i_1 : STD_LOGIC;
  signal net_gnd_const : STD_LOGIC_VECTOR ( 0 to 0 );
  signal processing_system7_0_ddr_ADDR : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal processing_system7_0_ddr_BA : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_ddr_CAS_N : STD_LOGIC;
  signal processing_system7_0_ddr_CKE : STD_LOGIC;
  signal processing_system7_0_ddr_CK_N : STD_LOGIC;
  signal processing_system7_0_ddr_CK_P : STD_LOGIC;
  signal processing_system7_0_ddr_CS_N : STD_LOGIC;
  signal processing_system7_0_ddr_DM : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_ddr_DQ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_ddr_DQS_N : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_ddr_DQS_P : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_ddr_ODT : STD_LOGIC;
  signal processing_system7_0_ddr_RAS_N : STD_LOGIC;
  signal processing_system7_0_ddr_RESET_N : STD_LOGIC;
  signal processing_system7_0_ddr_WE_N : STD_LOGIC;
  signal processing_system7_0_fclk_clk0 : STD_LOGIC;
  signal processing_system7_0_fclk_clk1 : STD_LOGIC;
  signal processing_system7_0_fclk_reset0_n : STD_LOGIC;
  signal processing_system7_0_fixed_io_DDR_VRN : STD_LOGIC;
  signal processing_system7_0_fixed_io_DDR_VRP : STD_LOGIC;
  signal processing_system7_0_fixed_io_MIO : STD_LOGIC_VECTOR ( 53 downto 0 );
  signal processing_system7_0_fixed_io_PS_CLK : STD_LOGIC;
  signal processing_system7_0_fixed_io_PS_PORB : STD_LOGIC;
  signal processing_system7_0_fixed_io_PS_SRSTB : STD_LOGIC;
  signal processing_system7_0_gpio_o : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_i2c1_scl_o : STD_LOGIC;
  signal processing_system7_0_i2c1_scl_t : STD_LOGIC;
  signal processing_system7_0_i2c1_sda_o : STD_LOGIC;
  signal processing_system7_0_i2c1_sda_t : STD_LOGIC;
  signal processing_system7_0_iic_0_SCL_I : STD_LOGIC;
  signal processing_system7_0_iic_0_SCL_O : STD_LOGIC;
  signal processing_system7_0_iic_0_SCL_T : STD_LOGIC;
  signal processing_system7_0_iic_0_SDA_I : STD_LOGIC;
  signal processing_system7_0_iic_0_SDA_O : STD_LOGIC;
  signal processing_system7_0_iic_0_SDA_T : STD_LOGIC;
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
  signal NLW_processing_system7_0_GPIO_T_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
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
  GPIO_O(31 downto 0) <= processing_system7_0_gpio_o(31 downto 0);
  I2C1_SCL_O <= processing_system7_0_i2c1_scl_o;
  I2C1_SCL_T <= processing_system7_0_i2c1_scl_t;
  I2C1_SDA_O <= processing_system7_0_i2c1_sda_o;
  I2C1_SDA_T <= processing_system7_0_i2c1_sda_t;
  IIC_0_scl_o <= processing_system7_0_iic_0_SCL_O;
  IIC_0_scl_t <= processing_system7_0_iic_0_SCL_T;
  IIC_0_sda_o <= processing_system7_0_iic_0_SDA_O;
  IIC_0_sda_t <= processing_system7_0_iic_0_SDA_T;
  clk_100mhz <= processing_system7_0_fclk_clk0;
  clk_200mhz <= processing_system7_0_fclk_clk1;
  i2c1_scl_i_1 <= I2C1_SCL_I;
  i2c1_sda_i_1 <= I2C1_SDA_I;
  processing_system7_0_iic_0_SCL_I <= IIC_0_scl_i;
  processing_system7_0_iic_0_SDA_I <= IIC_0_sda_i;
  resetn <= processing_system7_0_fclk_reset0_n;
GND: unisim.vcomponents.GND
    port map (
      G => GND_1
    );
net_gnd: component zynq_sys_xlconstant_0_0
    port map (
      const(0) => net_gnd_const(0)
    );
processing_system7_0: component zynq_sys_processing_system7_0_0
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
      FCLK_CLK0 => processing_system7_0_fclk_clk0,
      FCLK_CLK1 => processing_system7_0_fclk_clk1,
      FCLK_RESET0_N => processing_system7_0_fclk_reset0_n,
      GPIO_I(31) => GND_1,
      GPIO_I(30) => GND_1,
      GPIO_I(29) => GND_1,
      GPIO_I(28) => GND_1,
      GPIO_I(27) => GND_1,
      GPIO_I(26) => GND_1,
      GPIO_I(25) => GND_1,
      GPIO_I(24) => GND_1,
      GPIO_I(23) => GND_1,
      GPIO_I(22) => GND_1,
      GPIO_I(21) => GND_1,
      GPIO_I(20) => GND_1,
      GPIO_I(19) => GND_1,
      GPIO_I(18) => GND_1,
      GPIO_I(17) => GND_1,
      GPIO_I(16) => GND_1,
      GPIO_I(15) => GND_1,
      GPIO_I(14) => GND_1,
      GPIO_I(13) => GND_1,
      GPIO_I(12) => GND_1,
      GPIO_I(11) => GND_1,
      GPIO_I(10) => GND_1,
      GPIO_I(9) => GND_1,
      GPIO_I(8) => GND_1,
      GPIO_I(7) => GND_1,
      GPIO_I(6) => GND_1,
      GPIO_I(5) => GND_1,
      GPIO_I(4) => GND_1,
      GPIO_I(3) => GND_1,
      GPIO_I(2) => GND_1,
      GPIO_I(1) => GND_1,
      GPIO_I(0) => GND_1,
      GPIO_O(31 downto 0) => processing_system7_0_gpio_o(31 downto 0),
      GPIO_T(31 downto 0) => NLW_processing_system7_0_GPIO_T_UNCONNECTED(31 downto 0),
      I2C0_SCL_I => processing_system7_0_iic_0_SCL_I,
      I2C0_SCL_O => processing_system7_0_iic_0_SCL_O,
      I2C0_SCL_T => processing_system7_0_iic_0_SCL_T,
      I2C0_SDA_I => processing_system7_0_iic_0_SDA_I,
      I2C0_SDA_O => processing_system7_0_iic_0_SDA_O,
      I2C0_SDA_T => processing_system7_0_iic_0_SDA_T,
      I2C1_SCL_I => i2c1_scl_i_1,
      I2C1_SCL_O => processing_system7_0_i2c1_scl_o,
      I2C1_SCL_T => processing_system7_0_i2c1_scl_t,
      I2C1_SDA_I => i2c1_sda_i_1,
      I2C1_SDA_O => processing_system7_0_i2c1_sda_o,
      I2C1_SDA_T => processing_system7_0_i2c1_sda_t,
      MIO(53 downto 0) => FIXED_IO_mio(53 downto 0),
      M_AXI_GP0_ACLK => processing_system7_0_fclk_clk0,
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
      TTC0_CLK0_IN => GND_1,
      TTC0_CLK1_IN => GND_1,
      TTC0_CLK2_IN => GND_1,
      TTC0_WAVE0_OUT => NLW_processing_system7_0_TTC0_WAVE0_OUT_UNCONNECTED,
      TTC0_WAVE1_OUT => NLW_processing_system7_0_TTC0_WAVE1_OUT_UNCONNECTED,
      TTC0_WAVE2_OUT => NLW_processing_system7_0_TTC0_WAVE2_OUT_UNCONNECTED,
      USB0_PORT_INDCTL(1 downto 0) => NLW_processing_system7_0_USB0_PORT_INDCTL_UNCONNECTED(1 downto 0),
      USB0_VBUS_PWRFAULT => GND_1,
      USB0_VBUS_PWRSELECT => NLW_processing_system7_0_USB0_VBUS_PWRSELECT_UNCONNECTED
    );
end STRUCTURE;
