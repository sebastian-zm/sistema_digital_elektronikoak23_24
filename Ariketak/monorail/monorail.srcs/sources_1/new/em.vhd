----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.05.2024 10:45:32
-- Design Name: 
-- Module Name: em - Behavioral
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

entity em is
    Port ( W19 : in STD_LOGIC;
           T17 : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end em;

architecture Behavioral of em is

signal oraingoa: STD_LOGIC_VECTOR(2 downto 0);

begin

process(clk, rst)
begin
if rst = '1' then
    oraingoa <= "000";
elsif clk'event and clk = '1' then
    if W19 = '1' then
        oraingoa <= oraingoa + 1;
    elsif T17 = '1' then
        oraingoa <= oraingoa - 1;
    else
        oraingoa <= oraingoa;
    end if;
end if;
end process;

with oraingoa select
    seg <= "1111110" when "000",
           "1111101" when "001",
           "1111011" when "010",
           "1110111" when "011",
           "1110111" when "100",
           "1101111" when "101",
           "1011111" when "110",
           "1111110" when "111",
           "1111111" when others;
with oraingoa select
    an <= "1110" when "000",
          "1110" when "001",
          "1110" when "010",
          "1110" when "011",
          "1101" when "100",
          "1101" when "101",
          "1101" when "110",
          "1101" when "111",
          "1111" when others;

end Behavioral;
