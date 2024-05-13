----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.05.2024 09:25:43
-- Design Name: 
-- Module Name: em_tb - Behavioral
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

entity em_tb is
--  Port ( );
end em_tb;

architecture Behavioral of em_tb is
component em is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           organo : in STD_LOGIC;
           incienso : in STD_LOGIC;
           canto : out STD_LOGIC;
           risa : out STD_LOGIC);
end component;
signal clk, rst, organo, incienso, canto, risa: std_logic;
begin

dut: em port map (
    clk => clk,
    rst => rst,
    organo => organo,
    incienso => incienso,
    canto => canto,
    risa => risa
);

clock: process
begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
end process;

stim_proc: process
begin
    rst <= '1';
    organo <= '0';
    incienso <= '0';
    wait for 30 ns;
    rst <= '0';
    wait for 10 ns;
    incienso <= '1';
    wait for 10 ns;
    organo <= '1';
    wait for 10 ns;
    incienso <= '0';
    organo <= '0';
    wait;
end process;

end Behavioral;
