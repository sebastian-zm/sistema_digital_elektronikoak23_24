----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.06.2024 19:09:30
-- Design Name: 
-- Module Name: Egoera_Makina2 - Behavioral
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

entity Egoera_Makina2 is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           data_strobe : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end Egoera_Makina2;

architecture Behavioral of Egoera_Makina2 is

signal s_on, s_on_next: std_logic;
signal kont, kont_next: std_logic_vector(9 downto 0);

begin

kont_next <= kont + 1;
s_on_next <= '0' when data_strobe='1' and data_in = "01000010" else -- B en la tabla ASCII
             '1' when data_strobe='1' and data_in = "01010011" else -- S en la tabla ASCII
             s_on;

process
begin
    if rst = '1' then
        s_on <= '0';
        kont <= "0000000000";
    elsif clk'event and clk = '1' then
        s_on <= s_on_next;
        kont <= kont_next;
    end if;
end process;

with s_on & kont(9 downto 8) select
seg <= "0001000" when "000", --A
       "1000001" when "001", --U
       "0000111" when "010", --t
       "0100011" when "011", --o
       "1001000" when "100", --M
       "0001000" when "101", --A
       "0101011" when "110", --n
       "1000001" when "111", --U
       "0000000" when others;
       
with kont(9 downto 8) select
an <= "0111" when "00",
      "1011" when "01",
      "1101" when "10",
      "1110" when "11",
      "1111" when others;

end Behavioral;
