----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.05.2024 12:14:34
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           txartel : in STD_LOGIC_VECTOR (1 downto 0);
           irekita : in STD_LOGIC;
           itxita : in STD_LOGIC;
           fotozelula : in STD_LOGIC;
           ireki : out STD_LOGIC;
           itxi : out STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           alarma : out STD_LOGIC);
end top;

architecture Behavioral of top is
signal bin, kont2, kont5: std_logic_vector(3 downto 0);
signal kont_en5, kont_en2, kont2_end: std_logic;

component em is
    Port ( txartel : in STD_LOGIC_VECTOR (1 downto 0);
           irekita : in STD_LOGIC;
           itxita : in STD_LOGIC;
           fotozelula : in STD_LOGIC;
           kont2_end : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           ireki : out STD_LOGIC;
           itxi : out STD_LOGIC;
           bin : out STD_LOGIC_VECTOR(3 downto 0);
           kont_en2 : out STD_LOGIC;
           kont_en5 : out STD_LOGIC);
end component;
component kont is
    Generic (
        n: natural := 50_000_000
    );
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           enable : in STD_LOGIC;
           ended : out STD_LOGIC;
           zenb : out STD_LOGIC_VECTOR (integer(ceil(log2(real(n)))) downto 0));
end component;
component zazpi_segmentu is
    Port ( bin : in STD_LOGIC_VECTOR (3 downto 0);
           display : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end component;
begin
seg7: zazpi_segmentu port map (
    bin => bin,
    seg => seg,
    an => an,
    display => "0001"
);
kontadore5: kont generic map (
    n => 500_000_000
) port map (
    clk => clk,
    rst => rst,
    enable => kont_en5,
    ended => alarma
);
kontadore2: kont generic map (
    n => 200_000_000
) port map (
    clk => clk,
    rst => rst,
    enable => kont_en2,
    ended => kont2_end
);

ema: em port map (
    txartel => txartel,
    irekita => irekita,
    itxita => itxita,
    fotozelula => fotozelula,
    kont2_end => kont2_end,
    clk => clk,
    rst => rst,
    ireki => ireki,
    itxi => itxi,
    bin => bin,
    kont_en2 => kont_en2,
    kont_en5 => kont_en5
);

end Behavioral;
