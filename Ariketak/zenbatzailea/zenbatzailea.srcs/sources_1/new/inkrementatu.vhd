----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2024 10:43:08
-- Design Name: 
-- Module Name: inkrementatu - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity inkrementatu is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(3 downto 0));
end inkrementatu;

architecture Behavioral of inkrementatu is
signal kont: STD_LOGIC_VECTOR(3 downto 0);
begin

Q <= kont;

process(clk,rst)
begin
    if rst = '1' then
        kont <= (others => '0');
    elsif (clk'event and clk='1') then
        kont <= kont + 1;
    end if;
end process;

end Behavioral;
