----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2024 15:31:19
-- Design Name: 
-- Module Name: baud_16x - Behavioral
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

entity baud_16x is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           O : out STD_LOGIC);
end baud_16x;

architecture Behavioral of baud_16x is

signal kont, kont_next: integer;
signal O_next: std_logic;

begin

kont_next <= 1 when kont >= 217 else
             kont + 1;
O_next <= '1' when kont < 27 else
          '0' when kont < 54 else
          '1' when kont < 81 else
          '0' when kont < 108 else
          '1' when kont < 135 else
          '0' when kont < 163 else
          '1' when kont < 190 else
          '0';


process(clk,rst)
begin
if rst = '1' then
    kont <= 0;
    O <= '0';
elsif clk'event and clk = '1' then
    kont <= kont_next;
    O <= O_next;
end if;
end process;
end Behavioral;
