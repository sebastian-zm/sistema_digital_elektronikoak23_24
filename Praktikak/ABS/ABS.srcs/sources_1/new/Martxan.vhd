----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2024 13:25:05
-- Design Name: 
-- Module Name: Martxan - Behavioral
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

entity Martxan is
    Port ( Birak : in STD_LOGIC_VECTOR (3 downto 0);
           Martxan : out STD_LOGIC);
end Martxan;

architecture Behavioral of Martxan is

begin

with Birak select
Martxan <= '0' when "0000",
           '1' when others;


end Behavioral;
