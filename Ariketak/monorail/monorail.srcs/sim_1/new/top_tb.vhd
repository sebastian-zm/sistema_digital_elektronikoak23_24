----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.05.2024 11:15:14
-- Design Name: 
-- Module Name: top_tb - Behavioral
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

entity top_tb is
--  Port ( );
end top_tb;

architecture Behavioral of top_tb is
component top is
    Port ( V16 : in STD_LOGIC;
           V17 : in STD_LOGIC;
           W19 : in STD_LOGIC;
           T17 : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal V16, V17, W19, T17, clk, rst: std_logic;
signal seg: std_logic_vector(6 downto 0);
signal an: std_logic_vector(3 downto 0);
begin

clock: process
begin
clk <= '0'; wait for 5 ns;
clk <= '1'; wait for 5 ns;
end process;

dut: top port map (
    V16 => V16,
    V17 => V17,
    W19 => W19,
    T17 => T17,
    clk => clk,
    rst => rst,
    seg => seg,
    an => an
);

stim_proc: process
begin
rst <= '1';
V16 <= '0';
V17 <= '0';
W19 <= '0';
T17 <= '0';
wait for 20 ns;
rst <= '0';
wait for 400 ns;
W19 <= '1';
wait for 400 ns;
V16 <= '1';
W19 <= '0';
T17 <= '1';
V17 <= '1';
wait;
end process;

end Behavioral;
