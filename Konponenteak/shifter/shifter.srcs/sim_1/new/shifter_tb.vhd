----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2024 14:27:38
-- Design Name: 
-- Module Name: shifter_tb - Behavioral
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

entity shifter_tb is
--  Port ( );
end shifter_tb;

architecture Behavioral of shifter_tb is

component shifter is
    Port ( D : in STD_LOGIC;
           R : in STD_LOGIC;
           F : in STD_LOGIC;
           A : in STD_LOGIC;
           S : in STD_LOGIC_VECTOR (7 downto 0);
           I : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal D, R, F, A: std_logic;
signal S, I: std_logic_vector (7 downto 0);

begin

dut: shifter port map (
    D => D,
    R => R,
    F => F,
    A => A,
    S => S,
    I => I
);

stim_proc: process
begin
S <= "11000011";
D <= '0';
R <= '0';
F <= '0';
A <= '0';
wait for 2 ns;
A <= '1';
wait for 2 ns;
F <= '1';
wait for 2 ns;
R <= '1';
wait for 2 ns;
D <= '1';
wait for 2 ns;
R <= '0';
wait for 2 ns;
F <= '0';
wait;

end process;

end Behavioral;
