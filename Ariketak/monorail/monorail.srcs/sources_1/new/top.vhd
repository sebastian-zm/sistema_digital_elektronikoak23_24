----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.05.2024 11:01:59
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port ( V16 : in STD_LOGIC;
           V17 : in STD_LOGIC;
           W19 : in STD_LOGIC;
           T17 : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end top;

architecture Behavioral of top is
component em is
    Port ( W19 : in STD_LOGIC;
           T17 : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end component;
component frek_zatitzailea is
    Generic (
        n : natural := 50_000_000
    );
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           enable : in STD_LOGIC;
           clk_berri : out STD_LOGIC);
end component;
component multiplexor is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;
           SEL : in STD_LOGIC_VECTOR (1 downto 0);
           O: out STD_LOGIC);
end component;

signal s_clk_1hz, s_clk_2hz, s_clk_4hz, s_clk_8hz, s_clk: std_logic;
begin

mux: multiplexor port map (
    A => s_clk_1hz,
    B => s_clk_2hz,
    C => s_clk_4hz,
    D => s_clk_8hz,
    sel(1) => V17,
    sel(0) => V16,
    O => s_clk
);

frek_zat1: frek_zatitzailea generic map (
    n => 50_000_000--16
) port map (
    clk => clk,
    rst => rst,
    enable => '1',
    clk_berri => s_clk_1hz
);
frek_zat2: frek_zatitzailea generic map (
    n => 25_000_000--8
) port map (
    clk => clk,
    rst => rst,
    enable => '1',
    clk_berri => s_clk_2hz
);
frek_zat4: frek_zatitzailea generic map (
    n => 12_500_000--4
) port map (
    clk => clk,
    rst => rst,
    enable => '1',
    clk_berri => s_clk_4hz
);
frek_zat8: frek_zatitzailea generic map (
    n => 6_250_000--2
) port map (
    clk => clk,
    rst => rst,
    enable => '1',
    clk_berri => s_clk_8hz
);
em1: em port map (
    W19 => W19,
    T17 => T17,
    clk => s_clk,
    rst => rst,
    seg => seg,
    an => an
);

end Behavioral;
