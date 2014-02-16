----------------------------------------------------------------------------------
-- Company: Trenz Electronic GmbH
-- Engineer: Oleksandr Kiyenko
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
library UNISIM; 
use UNISIM.VCOMPONENTS.ALL; 
library work;
use work.all;
-------------------------------------------------------------------------------
entity top is
port (
	DDR_addr 			: inout STD_LOGIC_VECTOR (14 downto 0);
	DDR_ba 				: inout STD_LOGIC_VECTOR ( 2 downto 0);
	DDR_cas_n 			: inout STD_LOGIC;
	DDR_ck_n 			: inout STD_LOGIC;
	DDR_ck_p 			: inout STD_LOGIC;
	DDR_cke 			: inout STD_LOGIC;
	DDR_cs_n 			: inout STD_LOGIC;
	DDR_dm 				: inout STD_LOGIC_VECTOR ( 3 downto 0);
	DDR_dq 				: inout STD_LOGIC_VECTOR (31 downto 0);
	DDR_dqs_n 			: inout STD_LOGIC_VECTOR ( 3 downto 0);
	DDR_dqs_p 			: inout STD_LOGIC_VECTOR ( 3 downto 0);
	DDR_odt 			: inout STD_LOGIC;
	DDR_ras_n 			: inout STD_LOGIC;
	DDR_reset_n 		: inout STD_LOGIC;
	DDR_we_n 			: inout STD_LOGIC;
	FIXED_IO_ddr_vrn 	: inout STD_LOGIC;
	FIXED_IO_ddr_vrp 	: inout STD_LOGIC;
	FIXED_IO_mio 		: inout STD_LOGIC_VECTOR (53 downto 0);
	FIXED_IO_ps_clk 	: inout STD_LOGIC;
	FIXED_IO_ps_porb 	: inout STD_LOGIC;
	FIXED_IO_ps_srstb	: inout STD_LOGIC;
	-- CPLD I2C
	cpld_x5 			: in	STD_LOGIC;
	cpld_x0 			: out	STD_LOGIC;
	cpld_x1 			: out	STD_LOGIC;
	cpld_x7 			: out	STD_LOGIC;
	-- HDMI I2C
	HDMI_SCL			: inout STD_LOGIC;
	HDMI_SDA			: inout STD_LOGIC
);
end top;
-------------------------------------------------------------------------------
architecture Behavioral of top is
-------------------------------------------------------------------------------
-- Components
-------------------------------------------------------------------------------
-- Constants
constant net_vcc					: STD_LOGIC := '1';
constant net_gnd					: STD_LOGIC := '0';
-------------------------------------------------------------------------------
-- Signals
signal clk_100mhz					: STD_LOGIC;
signal clk_200mhz					: STD_LOGIC;
signal resetn 						: STD_LOGIC;
signal i2c1_scl_i					: STD_LOGIC;
signal i2c1_scl_o					: STD_LOGIC;
signal i2c1_scl_t					: STD_LOGIC;
signal i2c1_sda_i					: STD_LOGIC;
signal i2c1_sda_o					: STD_LOGIC;
signal i2c1_sda_t					: STD_LOGIC;
signal gpio_o						: STD_LOGIC_VECTOR(31 downto 0);
-------------------------------------------------------------------------------
begin
-------------------------------------------------------------------------------
zynq_sys_i: entity work.zynq_sys_wrapper
port map (
	DDR_addr(14 downto 0) 	=> DDR_addr(14 downto 0),
	DDR_ba(2 downto 0) 		=> DDR_ba(2 downto 0),
	DDR_cas_n 				=> DDR_cas_n,
	DDR_ck_n 				=> DDR_ck_n,
	DDR_ck_p 				=> DDR_ck_p,
	DDR_cke 				=> DDR_cke,
	DDR_cs_n 				=> DDR_cs_n,
	DDR_dm(3 downto 0) 		=> DDR_dm(3 downto 0),
	DDR_dq(31 downto 0) 	=> DDR_dq(31 downto 0),
	DDR_dqs_n(3 downto 0) 	=> DDR_dqs_n(3 downto 0),
	DDR_dqs_p(3 downto 0) 	=> DDR_dqs_p(3 downto 0),
	DDR_odt 				=> DDR_odt,
	DDR_ras_n 				=> DDR_ras_n,
	DDR_reset_n 			=> DDR_reset_n,
	DDR_we_n 				=> DDR_we_n,
	FIXED_IO_ddr_vrn 		=> FIXED_IO_ddr_vrn,
	FIXED_IO_ddr_vrp 		=> FIXED_IO_ddr_vrp,
	FIXED_IO_mio			=> FIXED_IO_mio(53 downto 0),
	FIXED_IO_ps_clk 		=> FIXED_IO_ps_clk,
	FIXED_IO_ps_porb 		=> FIXED_IO_ps_porb,
	FIXED_IO_ps_srstb 		=> FIXED_IO_ps_srstb,
	-- CPLD I2C 
	I2C1_SCL_I				=> i2c1_scl_i,
	I2C1_SCL_O				=> i2c1_scl_o,
	I2C1_SCL_T				=> i2c1_scl_t,
	I2C1_SDA_I				=> i2c1_sda_i,
	I2C1_SDA_O				=> i2c1_sda_o,
	I2C1_SDA_T				=> i2c1_sda_t,
	-- Common
	clk_100mhz				=> clk_100mhz,
	clk_200mhz				=> clk_200mhz,
	resetn					=> resetn,
	-- HDMI I2C (TE0701)
	iic_0_scl_io			=> HDMI_SCL,
	iic_0_sda_io			=> HDMI_SDA,
	-- GPIO
	GPIO_O					=> gpio_o	
);
-------------------------------------------------------------------------------
-- Glue logic for CPLD I2C
cpld_x0			<= not gpio_o(0);				-- I2C bus switch
cpld_x1			<= i2c1_scl_o or i2c1_scl_t;	-- CPLD <= SCL
i2c1_scl_i		<= i2c1_scl_o or i2c1_scl_t;	-- SCL feedback
cpld_x7			<= i2c1_sda_o or i2c1_sda_t;	-- CPLD <= SDA
i2c1_sda_i		<= cpld_x5;						-- CPLD => SDA
-------------------------------------------------------------------------------
end Behavioral;
