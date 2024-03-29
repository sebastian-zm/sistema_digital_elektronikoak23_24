----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2024 13:23:06
-- Design Name: 
-- Module Name: argia - Behavioral
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

entity argia is
    Port ( Martxan : in STD_LOGIC;
           Aktibatuta : in STD_LOGIC_VECTOR (3 downto 0);
           Argia : out STD_LOGIC);
end argia;

architecture Behavioral of argia is

begin

Argia <= '1' when Martxan = '1' and not Aktibatuta = "0000" else '0';

end Behavioral;
