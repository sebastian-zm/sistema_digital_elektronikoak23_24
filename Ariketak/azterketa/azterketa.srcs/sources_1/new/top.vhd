----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.05.2024 10:48:04
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
use IEEE.MATH_REAL.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( rst : in STD_LOGIC;
           btnu : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (3 downto 0);
           btnc : in STD_LOGIC;
           clk : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end top;

architecture Behavioral of top is
signal amaituta, boom, off, kont_en, clk_1hz, clk_10khz : STD_LOGIC;
signal n_inv, sw_inv, n, kont_n: STD_LOGIC_VECTOR (3 downto 0);
signal kont_seg: STD_LOGIC_VECTOR (6 downto 0);
signal off_seg : STD_LOGIC_VECTOR (20 downto 0);
signal boom_seg, seg_v : STD_LOGIC_VECTOR (27 downto 0);

component em1 is
    Port ( BTNU : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           amaituta : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           boom : out STD_LOGIC;
           off : out STD_LOGIC;
           kont_en : out STD_LOGIC);
end component;
component em2 is
    Port ( seg_v : in STD_LOGIC_VECTOR (27 downto 0);
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
component kont is
    Generic (
        n: natural := 100_000_000
    );
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           enable : in STD_LOGIC;
           ended : out STD_LOGIC;
           zenb : out STD_LOGIC_VECTOR (integer(ceil(log2(real(n)+1.0)))-1 downto 0));
end component;
component multiplexor is
    Generic (
        n : natural := 27
    );
    Port ( A : in STD_LOGIC_VECTOR (n downto 0);
           B : in STD_LOGIC_VECTOR (n downto 0);
           C : in STD_LOGIC_VECTOR (n downto 0);
           D : in STD_LOGIC_VECTOR (n downto 0);
           SEL : in STD_LOGIC_VECTOR (1 downto 0);
           O: out STD_LOGIC_VECTOR (n downto 0));
end component;
component zazpi_segmentu is
    Port ( bin : in STD_LOGIC_VECTOR (3 downto 0);
           display : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end component;
begin
seg7: zazpi_segmentu port map (
    bin => n,
    display => "0001", -- Edozer balio du.
    seg => kont_seg
);
mux_boom: multiplexor port map (
    A => (others => '1'),
    B => (others => '1'),
    C(27 downto 21) => "0000000",
    C(20 downto 14) => "1000000",
    C(13 downto 7) => "1000000",
    C(6 downto 0) => "1001000",
    D => (others => '1'),
    sel(0) => '0',
    sel(1) => clk_1hz,
    O => boom_seg
);
mux: multiplexor port map (
    A(27 downto 7) => (others => '1'),
    A(6 downto 0) => kont_seg,
    B(27 downto 21) => (others => '1'),
    B(20 downto 14) => "1000000",
    B(13 downto 7) => "0001110",
    B(6 downto 0) => "0001110",
    C => boom_seg,
    D => (others => '1'),
    sel(0) => off,
    sel(1) => boom,
    O => seg_v
);
konta: kont generic map (
    n => 15
) port map (
    clk => clk_1hz,
    rst => rst,
    enable => kont_en,
    zenb => kont_n
);
frek_zat1: frek_zatitzailea generic map (
    n => 50_000_000
) port map (
    clk => clk,
    rst => rst,
    enable => '1',
    clk_berri => clk_1hz
);
frek_zat2: frek_zatitzailea generic map (
    n => 5_000
) port map (
    clk => clk,
    rst => rst,
    enable => '1',
    clk_berri => clk_10khz
);

ema2: em2 port map (
    seg_v => seg_v,
    clk => clk_10khz,
    rst => rst,
    seg => seg,
    an => an
);

ema1: em1 port map (
    btnu => btnu,
    btnc => btnc,
    amaituta => amaituta,
    clk => clk,
    rst => rst,
    boom => boom,
    off => off,
    kont_en => kont_en
);

--amaituta <= n(3) and n(2) and n(1) and n(0);
amaituta <= n_inv(3) and n_inv(2) and n_inv(1) and n_inv(0);
n_inv <= kont_n + sw_inv;
n <= not n_inv;
sw_inv <= not sw;

end Behavioral;
