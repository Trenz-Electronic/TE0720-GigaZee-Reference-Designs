-------------------------------------------------------------------------------
-- Company: 		Trenz Electronic GmbH
-- Engineer: 		Oleksandr Kiyenko
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
----------------------------------------------------------------------------------
entity te0720_glue is
port(
	-- I2C
	SDA_I	 		: out	STD_LOGIC;
	SDA_O	 		: in	STD_LOGIC;
	SDA_T	 		: in	STD_LOGIC;
	SCL_I	 		: out	STD_LOGIC;
	SCL_O	 		: in	STD_LOGIC;
	SCL_T	 		: in	STD_LOGIC;
	-- GPIO
	GPIO_I			: out	STD_LOGIC_VECTOR(31 downto 0);
	GPIO_O			: in	STD_LOGIC_VECTOR(31 downto 0);
	GPIO_T			: in	STD_LOGIC_VECTOR(31 downto 0);
	-- I2C - CPLD connection
	X5				: in	STD_LOGIC;		-- i2c_sda_in
	X7				: out 	STD_LOGIC;		-- i2c_sda_out
	X0				: out	STD_LOGIC;		-- i2c_sw
	X1				: out 	STD_LOGIC		-- i2c_scl_out
);
end te0720_glue;
----------------------------------------------------------------------------------
architecture Behavioral of te0720_glue is
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
begin
----------------------------------------------------------------------------------
-- I2C to CPLD
GPIO_I			<= x"12345678";		-- Stub for GPIO input signals
X0				<= not GPIO_O(0);	-- I2C bus switch control signal
SDA_I			<= X5;				-- SDA in
SCL_I			<= SCL_O or SCL_T;	-- SCL feedback
X7				<= SDA_O or SDA_T;	-- CPLD SDA
X1				<= SCL_O or SCL_T;	-- CPLD SCL
----------------------------------------------------------------------------------
end Behavioral;
----------------------------------------------------------------------------------
