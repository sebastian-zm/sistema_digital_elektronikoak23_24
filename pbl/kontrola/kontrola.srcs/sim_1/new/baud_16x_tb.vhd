----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.05.2024 12:19:35
-- Design Name: 
-- Module Name: baud_16x_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity baud_16x_tb is
--  Port ( );
end baud_16x_tb;

architecture Behavioral of baud_16x_tb is
component baud_16x is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           O : out STD_LOGIC);
end component;
signal clk, rst, O: std_logic;
begin

process
begin
clk <= '1';
wait for 5 ns;
clk <= '0';
wait for 5 ns;
end process;

b16: baud_16x port map (
    clk => clk,
    rst => rst,
    O => O
);

process
begin
rst <= '1';
wait for 20 ns;
rst <= '0';
wait;
end process;

end Behavioral;
