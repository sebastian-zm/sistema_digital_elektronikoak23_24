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


I <= "1000" when S(7) = '1' else
     "0111" when S(6) = '1' else
     "0110" when S(5) = '1' else
     "0101" when S(4) = '1' else
     "0100" when S(3) = '1' else
     "0011" when S(2) = '1' else
     "0010" when S(1) = '1' else
     "0001" when S(0) = '1' else
     "0000";

end Behavioral;
