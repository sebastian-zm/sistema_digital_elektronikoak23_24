----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2024 15:32:50
-- Design Name: 
-- Module Name: dekode - Behavioral
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

entity dekode is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           I : out STD_LOGIC_VECTOR (7 downto 0));
end dekode;

architecture Behavioral of dekode is

begin
forloop: for ZBKI in 0 to 7 generate
    with S select
        I(ZBKI) <= '1' when std_logic_vector(to_unsigned(ZBKI, 3)),
                   '0' when others;
end generate forloop;

end Behavioral;
