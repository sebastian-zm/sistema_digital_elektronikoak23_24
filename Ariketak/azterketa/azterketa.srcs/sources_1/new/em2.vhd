----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.05.2024 10:49:51
-- Design Name: 
-- Module Name: em2 - Behavioral
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

entity em2 is
    Port ( seg_v : in STD_LOGIC_VECTOR (27 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end em2;

architecture Behavioral of em2 is
signal oraingoa : STD_LOGIC_VECTOR(1 downto 0);
begin

process(clk,rst)
begin
if rst = '1' then
    oraingoa <= "00";
elsif clk'event and clk = '1' then
    oraingoa <= oraingoa + 1;
end if;
end process;

with oraingoa select
seg <= seg_v(6 downto 0) when "00",
       seg_v(13 downto 7) when "01",
       seg_v(20 downto 14) when "10",
       seg_v(27 downto 21) when "11",
       "1111111" when others;
       
with oraingoa select
an <= "1110" when "00",
      "1101" when "01",
      "1011" when "10",
      "0111" when "11",
      "1111" when others;

end Behavioral;
