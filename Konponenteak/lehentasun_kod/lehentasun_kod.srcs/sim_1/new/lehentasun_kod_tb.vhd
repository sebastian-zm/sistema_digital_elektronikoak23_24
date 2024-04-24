----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.04.2024 16:53:58
-- Design Name: 
-- Module Name: lehentasun_kod_tb - Behavioral
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

entity lehentasun_kod_tb is
--  Port ( );
end lehentasun_kod_tb;

architecture Behavioral of lehentasun_kod_tb is
component lehentasun_kod is
    Port ( S : in STD_LOGIC_VECTOR (7 downto 0);
           I : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal s_I: STD_LOGIC_VECTOR (3 downto 0);
begin

lk: lehentasun_kod port map (
    S => (1 to 3 => '0', others => '1'),
    I => s_I
);

end Behavioral;
