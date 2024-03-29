----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.03.2024 12:03:50
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
    Port ( D1 : in STD_LOGIC_VECTOR (7 downto 0);
           D2 : in STD_LOGIC_VECTOR (7 downto 0);
           W19 : in STD_LOGIC;
           T17 : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end top;

architecture Behavioral of top is

component konparadorea is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           GT : out STD_LOGIC;
           EQ : out STD_LOGIC;
           LT : out STD_LOGIC);
end component;

component lehentasun_kod is
    Port ( S : in STD_LOGIC_VECTOR (7 downto 0);
           I : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component multiplexor is
    Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           SEL : in STD_LOGIC;
           O: out STD_LOGIC_VECTOR(3 downto 0));
end component;

component zazpi_segmentu is
    Port ( bin : in STD_LOGIC_VECTOR (3 downto 0);
           display : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal D1K, D2K, D_ONA: std_logic_vector(3 downto 0);
signal IS_GT, SEL, ENABLE: std_logic;

begin

ENABLE <= W19 xor T17;
SEL <= W19 xor IS_GT;

kod1: lehentasun_kod port map (
    S => D1,
    I => D1K
);
kod2: lehentasun_kod port map (
    S => D2,
    I => D2K
);
konp: konparadorea port map (
    A => D1K,
    B => D2K,
    GT => IS_GT
);
mux: multiplexor port map (
    A => D1K,
    B => D2K,
    SEL => SEL,
    O => D_ONA
);
seg7: zazpi_segmentu port map (
    seg => seg,
    an => an,
    bin => D_ONA,
    display(3 downto 1) => "000",
    display(0) => ENABLE
);

end Behavioral;
