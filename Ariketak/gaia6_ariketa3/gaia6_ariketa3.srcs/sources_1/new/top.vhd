----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2024 11:33:08
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
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           BTN : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end top;

architecture Behavioral of top is

component batutzaile_kentzaile is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);
end component;

component konparadorea is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           GT : out STD_LOGIC;
           EQ : out STD_LOGIC;
           LT : out STD_LOGIC);
end component;

component multiplexor is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           SEL : in STD_LOGIC;
           O: out STD_LOGIC_VECTOR (2 downto 0));
end component;

component zazpi_segmentu is
    Port ( bin : in STD_LOGIC_VECTOR (3 downto 0);
           display : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal handiena, txikiena, diferentzia, bin: STD_LOGIC_VECTOR (2 downto 0);

signal diferentzia_4bit: STD_LOGIC_VECTOR (3 downto 0);
signal gt, lt, eq, not_eq: STD_LOGIC;

begin

diferentzia <= diferentzia_4bit(2 downto 0);
not_eq <= not eq;

konp: konparadorea port map (
    A => A,
    B => B,
    GT => gt,
    LT => lt,
    EQ => eq
);

hand: multiplexor port map (
    A => A,
    B => B,
    SEL => lt,
    O => handiena
);

txik: multiplexor port map (
    A => A,
    B => B,
    SEL => gt,
    O => txikiena
);

kentzaile: batutzaile_kentzaile port map (
    A(2 downto 0) => handiena,
    A(3) => '0',
    B(2 downto 0) => txikiena,
    B(3) => '0',
    M => '1',
    S => diferentzia_4bit
);

mux: multiplexor port map (
    A => txikiena,
    B => diferentzia,
    SEL => BTN,
    O => bin
);

seg7: zazpi_segmentu port map (
    bin(2 downto 0) => bin,
    bin(3) => '0',
    display(3 downto 1) => "000",
    display(0) => not_eq,
    seg => seg,
    an => an
);

end Behavioral;
