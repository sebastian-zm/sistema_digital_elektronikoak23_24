----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.04.2024 11:34:19
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
    Port ( atea : in STD_LOGIC;
           btn_on : in STD_LOGIC;
           btn_off : in STD_LOGIC;
           programa : in STD_LOGIC_VECTOR(6 downto 0);
           denbora : in STD_LOGIC_VECTOR(3 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           argia : out STD_LOGIC;
           seg : out STD_LOGIC_VECTOR(6 downto 0);
           an : out STD_LOGIC_VECTOR(3 downto 0);
           magnetroia : out STD_LOGIC_VECTOR(2 downto 0));
end top;

architecture Behavioral of top is
component EM is
    Port ( atea : in STD_LOGIC;
           btn_on: in STD_LOGIC;
           btn_off: in STD_LOGIC;
           amaituta : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           argia : out STD_LOGIC;
           kont_enable : out STD_LOGIC;
           magnetroia : out STD_LOGIC);
end component;
component lehentasun_kod is
    Port ( S : in STD_LOGIC_VECTOR (6 downto 0);
           I : out STD_LOGIC_VECTOR (2 downto 0));
end component;
component frek_zatitzailea is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           clk_berri : out STD_LOGIC);
end component;

component zazpi_segmentu is
    Port ( bin : in STD_LOGIC_VECTOR (3 downto 0);
           display : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal amaitua, s_magnetroia, clk_1hz: std_logic;
signal s_programa : std_logic_vector(2 downto 0);
signal zenb : std_logic_vector(3 downto 0);
begin

forg: for ii in 0 to 2 generate
    magnetroia(ii) <= s_programa(ii) and s_magnetroia;
end generate forg;
lk: lehentasun_kod port map (
    S => programa,
    I => s_programa
);
seg7: zazpi_segmentu port map (
    seg => seg,
    an => an,
    bin => zenb,
    display => "0001"
);
frek_zat: frek_zatitzailea port map (
    clk => clk,
    rst => rst,
    clk_berri => clk_1hz
);
ema: EM port map (
    atea => atea,
    btn_on => btn_on,
    btn_off => btn_off,
    clk => clk,
    rst => rst,
    amaituta => amaitua,
    argia => argia,
    magnetroia => s_magnetroia
);

end Behavioral;
