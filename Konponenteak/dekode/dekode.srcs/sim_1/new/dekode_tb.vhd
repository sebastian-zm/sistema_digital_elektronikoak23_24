----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2024 15:41:07
-- Design Name: 
-- Module Name: dekode_tb - Behavioral
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

entity dekode_tb is
--  Port ( );
end dekode_tb;

architecture Behavioral of dekode_tb is

component dekode is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           I : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal S: std_logic_vector(2 downto 0);
signal I: std_logic_vector(7 downto 0);

begin

DUT: dekode port map (
    S => S,
    I => I
);

stim_proc: process
begin
    for idx in 0 to 7 loop
        S <= STD_LOGIC_VECTOR(to_unsigned(idx, 3));
        wait for 10 ns;
    end loop;
    wait;
end process;

end Behavioral;
