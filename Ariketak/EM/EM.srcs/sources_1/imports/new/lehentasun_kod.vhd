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
    Port ( S : in STD_LOGIC_VECTOR (6 downto 0);
           I : out STD_LOGIC_VECTOR (2 downto 0));
end lehentasun_kod;

architecture Behavioral of lehentasun_kod is



begin

I <= "111" when S(6) = '1' else
     "110" when S(5) = '1' else
     "101" when S(4) = '1' else
     "100" when S(3) = '1' else
     "011" when S(2) = '1' else
     "010" when S(1) = '1' else
     "001" when S(0) = '1' else
     "000";

end Behavioral;
