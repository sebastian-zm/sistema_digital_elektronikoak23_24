----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.03.2024 11:57:07
-- Design Name: 
-- Module Name: lehentasun_kod - Behavioral
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

entity lehentasun_kod is
    Port ( S : in STD_LOGIC_VECTOR (7 downto 0);
           I : out STD_LOGIC_VECTOR (3 downto 0));
end lehentasun_kod;

architecture Behavioral of lehentasun_kod is



begin

with S select
I <= "1000" when "1-------",
     "0111" when "01------",
     "0110" when "001-----",
     "0101" when "0001----",
     "0100" when "00001---",
     "0011" when "000001--",
     "0010" when "0000001-",
     "0001" when "00000001",
     "0000" when others;

end Behavioral;
