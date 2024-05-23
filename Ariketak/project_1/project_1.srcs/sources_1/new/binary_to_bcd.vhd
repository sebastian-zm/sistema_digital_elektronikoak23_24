----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.05.2024 15:28:11
-- Design Name: 
-- Module Name: binary_to_bcd - Behavioral
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

entity binary_to_bcd is
    Port ( bin : in STD_LOGIC_VECTOR (13 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           bcd : out STD_LOGIC_VECTOR (15 downto 0));
end binary_to_bcd;

architecture Behavioral of binary_to_bcd is

signal bcd_3, bcd_3_next: STD_LOGIC_VECTOR(15 downto 0);
signal s_bcd: STD_LOGIC_VECTOR(15 downto 0);

begin

forg: for ii in 0 to 3 generate
    bcd_3_next(4*ii + 3 downto 4*ii) <= s_bcd(4*ii + 3 downto 4*ii) when s_bcd(4*ii + 3 downto 4*ii) < 5 else
                                        s_bcd(4*ii + 3 downto 4*ii) + 3;
end generate forg;
sum_3: process
begin
if rst = '1' then
    bcd_3 <= (others => '0');
elsif clk'event and clk = '1' then
    bcd_3 <= bcd_3_next;
end if;


end Behavioral;
