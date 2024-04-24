----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2024 12:43:56
-- Design Name: 
-- Module Name: jk_ff_tb - Behavioral
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

entity jk_ff_tb is
--  Port ( );
end jk_ff_tb;

architecture Behavioral of jk_ff_tb is
component jk_ff is
    Port ( clk : in STD_LOGIC;
           j : in STD_LOGIC;
           k : in STD_LOGIC;
           q : out STD_LOGIC;
           qbar : out STD_LOGIC);
end component;
signal clk, j, k, q, qbar: std_logic;
begin
dut: jk_ff port map (
    clk => clk,
    j => j,
    k => k,
    q => q,
    qbar => qbar
);
process
begin

wait;
end process;

end Behavioral;
