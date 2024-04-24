----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2024 14:51:56
-- Design Name: 
-- Module Name: edge_detect - Behavioral
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

entity edge_detect is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           S : in STD_LOGIC;
           rising : out STD_LOGIC;
           falling : out STD_LOGIC);
end edge_detect;

architecture Behavioral of edge_detect is
signal s_prev, s_prev_prev, clk_1hz: std_logic;
component frek_zatitzailea is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           clk_berri : out STD_LOGIC);
end component;
begin
u1: frek_zatitzailea port map (
    clk => clk,
    rst => rst,
    clk_berri => clk_1hz
);

rising <= s_prev and not s_prev_prev;
falling <= not s_prev and s_prev_prev;
process(clk)
begin
    if clk_1hz'event and clk_1hz = '1' then
    end if;
end process;
process(clk)
begin
    if clk_1hz'event and clk_1hz = '1' then
        s_prev_prev <= s_prev;
        s_prev <= S;
    end if;
end process;

end Behavioral;
