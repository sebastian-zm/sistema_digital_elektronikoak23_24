----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2024 10:25:49
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
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           SEL : in STD_LOGIC_VECTOR (1 downto 0);
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

component demux is
    Port ( S : in STD_LOGIC;
           SEL : in STD_LOGIC_VECTOR(1 downto 0);
           A : out STD_LOGIC_VECTOR(3 downto 0));
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

signal gt: std_logic;
signal display: std_logic_vector(3 downto 0);
signal o: std_logic_vector(3 downto 0);
begin

konp: konparadorea port map (
    A => A,
    B => B,
    GT => GT
);

mux: multiplexor port map (
    SEL => GT,
    A => B,
    B => A,
    O => O
);

demux1: demux port map (
    S => '1',
    SEL => SEL,
    A => display
);

decod7: zazpi_segmentu port map (
    bin => O,
    display => display,
    seg => seg,
    an => an
);

end Behavioral;
