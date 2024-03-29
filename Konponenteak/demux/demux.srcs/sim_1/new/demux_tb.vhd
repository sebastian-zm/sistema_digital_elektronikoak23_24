----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2024 12:45:49
-- Design Name: 
-- Module Name: demux_tb - Behavioral
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

entity demux_tb is
--  Port ( );
end demux_tb;

architecture Behavioral of demux_tb is
component demux
    Port ( S : in STD_LOGIC;
           SEL : in STD_LOGIC_VECTOR(1 downto 0);
           IRTEERA: out STD_LOGIC_VECTOR(3 downto 0));
end component;

signal s_S, s_A, s_B, s_C, s_D: STD_LOGIC;
signal s_SEL: STD_LOGIC_VECTOR(1 downto 0);
begin

DUT: demux port map (
    S => s_S,
    SEL => s_SEL,
    IRTEERA(0) => s_A,
    IRTEERA(1) => s_B,
    IRTEERA(2) => s_C,
    IRTEERA(3) => s_D
);

stim_proc: process
    variable SARRERAK: STD_LOGIC_VECTOR(2 downto 0);
begin
    for i in 0 to 2**3-1 loop
        sarrerak := std_logic_vector(to_unsigned(i, 3));
        s_SEL <= sarrerak(2 downto 1);
        s_S <= sarrerak(0);
        wait for 10 ns;
    end loop;
    
    wait;
end process;

end Behavioral;
