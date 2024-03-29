----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2024 14:11:08
-- Design Name: 
-- Module Name: shifter - Behavioral
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

entity shifter is
    Port ( D : in STD_LOGIC;
           R : in STD_LOGIC;
           F : in STD_LOGIC;
           A : in STD_LOGIC;
           S : in STD_LOGIC_VECTOR (7 downto 0);
           I : out STD_LOGIC_VECTOR (7 downto 0));
end shifter;

architecture Behavioral of shifter is

begin

I <= S when A = '0' else
     S(0) & S(7 downto 1) when R = '1' and D = '0' else
     F & S(7 downto 1) when D = '0' else
     S(6 downto 0) & S(7) when R = '1' else
     S(6 downto 0) & F;

end Behavioral;
