----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.04.2024 14:28:26
-- Design Name: 
-- Module Name: kont - Behavioral
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

entity kont is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           enable : in STD_LOGIC;
           zenb : out STD_LOGIC_VECTOR (15 downto 0));
end kont;

architecture Behavioral of kont is

constant n: natural := 20_000;

signal s_zenb, s_zenb_next: STD_LOGIC_VECTOR (15 downto 0);
signal clk_1hz: std_logic;
begin
zenb <= s_zenb;
s_zenb_next <= (others => '0') when s_zenb >= n - 1 or enable = '0' else
               s_zenb + 1;

process(clk,rst)
begin
    if (rst = '1') then
        s_zenb <= (others => '0');
    elsif (clk'event and clk = '1') then
        s_zenb <= s_zenb_next;
    end if;
end process;

end Behavioral;
