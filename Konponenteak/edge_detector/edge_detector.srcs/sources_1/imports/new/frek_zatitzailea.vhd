----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.04.2024 11:47:20
-- Design Name: 
-- Module Name: clk_1Hz - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity frek_zatitzailea is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           clk_berri : out STD_LOGIC);
end frek_zatitzailea;

architecture Behavioral of frek_zatitzailea is

constant n: natural := 50_000_000;

signal s_kont: unsigned(integer(ceil(log2(real(n)))) downto 0);
signal s_clk: std_logic;
begin

clk_berri <= s_clk;

process(clk,rst)
begin
if (rst = '1') then
    s_kont <= to_unsigned(0, s_kont'length);
    s_clk <= '0';
elsif (clk'event and clk = '1') then
    if (s_kont >= n - 1) then
        s_kont <= to_unsigned(0, s_kont'length);
        s_clk <= not s_clk;
    else
        s_kont <= s_kont + 1;
    end if;
end if;
    
end process;

end Behavioral;
