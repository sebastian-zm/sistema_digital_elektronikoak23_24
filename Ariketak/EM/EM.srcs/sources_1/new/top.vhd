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
           interruptorea : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           argia : out STD_LOGIC;
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
component kronometro is
    Port ( denbora : in STD_LOGIC_VECTOR (3 downto 0);
           set : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause: in STD_LOGIC;
           bukatuta: out STD_LOGIC;
           clk : in STD_LOGIC;
           denbora_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;
component zazpi_segmentu is
    Port ( bin : in STD_LOGIC_VECTOR (3 downto 0);
           display : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal s_interruptorea: STD_LOGIC;
signal s_clk_1hz: STD_LOGIC;
signal s_kron_rst: STD_LOGIC;
signal s_kron_bukatuta: STD_LOGIC;
signal s_em_rst: STD_LOGIC;
signal s_frek_zat_rst: STD_LOGIC;
signal s_denbora: STD_LOGIC_VECTOR (3 downto 0);
signal s_programa: STD_LOGIC_VECTOR (2 downto 0);
signal s_on: STD_LOGIC;
begin

s_em_rst <= rst or s_kron_bukatuta;
s_kron_rst <= rst or not s_on;
s_frek_zat_rst <= rst or btn_on;
forg: for ii in 0 to 2 generate
    magnetroia(ii) <= s_programa(ii) and s_on;
end generate forg;
lk: lehentasun_kod port map (
    S => programa,
    I => s_programa
);
seg7: zazpi_segmentu port map (
    seg => seg,
    an => an,
    bin => s_denbora,
    display => "0001"
);
kron: kronometro port map (
    denbora => denbora,
    set => btn_on,
    pause => '0',
    rst => s_kron_rst,
    clk => s_clk_1hz,
    bukatuta => s_kron_bukatuta,
    denbora_out => s_denbora
);

frek_zat: frek_zatitzailea port map (
    clk => clk,
    rst => s_frek_zat_rst,
    clk_berri => s_clk_1hz
);
ema: EM port map (
    atea => atea,
    interruptorea => s_interruptorea,
    clk => clk,
    rst => s_em_rst,
    argia => argia,
    magnetroia => s_on
);

process(s_em_rst, clk)
begin
if s_em_rst = '1' then
    s_interruptorea <= '0';
elsif clk'event and clk = '1' then
    if btn_off = '1' or btn_on = '1' then
        s_interruptorea <= not btn_off;
    else
        s_interruptorea <= s_interruptorea;
    end if;
else
    s_interruptorea <= s_interruptorea;
end if;
end process;

end Behavioral;
