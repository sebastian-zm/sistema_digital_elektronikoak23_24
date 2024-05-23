----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.05.2024 11:27:50
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
signal rst, btnu, btnc, clk : STD_LOGIC;
signal seg : std_logic_vector(6 downto 0);
signal an, sw : std_logic_vector(3 downto 0);
component top is
    Port ( rst : in STD_LOGIC;
           btnu : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (3 downto 0);
           btnc : in STD_LOGIC;
           clk : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end component;
begin

erlojua: process
begin
clk <= '0';
wait for 5 ns;
clk <= '1';
wait for 5 ns;

end process;

dut: top port map (
    rst => rst,
    btnu => btnu,
    sw => sw,
    btnc => btnc,
    clk => clk,
    seg => seg,
    an => an
);

stim_proc: process
begin
rst <= '1';
btnu <= '0';
btnc <= '0';
sw <= "0011";
wait for 10 ns;
rst <= '0';
wait for 10 ns;
btnc <= '1';
wait for 10 ns;
btnc <= '0';
wait for 100 ns;
rst <= '1';
wait for 10 ns;
rst <= '0';
btnc <= '1';
wait for 10 ns;
btnc <= '0';
btnu <= '1';
wait;
end process;

end Behavioral;
