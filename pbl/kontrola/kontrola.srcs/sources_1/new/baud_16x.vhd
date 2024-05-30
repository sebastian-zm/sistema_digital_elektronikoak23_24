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

kont_next <= 1 when kont = 217 else
             kont + 1;
with kont select
    O_next <= '1' when 54,
              '1' when 108,
              '1' when 163,
              '1' when 217,
              '0' when others;


process
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
