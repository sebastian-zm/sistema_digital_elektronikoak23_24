----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2024 12:30:26
-- Design Name: 
-- Module Name: demux - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity demux is
    Port ( S : in STD_LOGIC;
           SEL : in STD_LOGIC_VECTOR(1 downto 0);
           IRTEERA : out STD_LOGIC_VECTOR(3 downto 0));
end demux;

architecture Behavioral of demux is
begin

forloop: for I in 0 to 3 generate
    IRTEERA(I) <= S when SEL = STD_LOGIC_VECTOR(TO_UNSIGNED(I, 2)) else '0';
end generate forloop;

end Behavioral;
