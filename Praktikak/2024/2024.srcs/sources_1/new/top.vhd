----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.04.2024 14:46:26
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
    Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end top;

architecture Behavioral of top is

component kont is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           zenb : out STD_LOGIC_VECTOR (1 downto 0));
end component;

component multiplexor is
    Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           C : in STD_LOGIC_VECTOR(3 downto 0);
           D : in STD_LOGIC_VECTOR(3 downto 0);
           SEL : in STD_LOGIC_VECTOR (1 downto 0);
           O: out STD_LOGIC_VECTOR(3 downto 0));
end component;

component zazpi_segmentu is
    Port ( bin : in STD_LOGIC_VECTOR (3 downto 0);
           display : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal sel: std_logic_vector(1 downto 0);
signal bin: std_logic_vector(3 downto 0);
begin

U1: kont port map (
    clk => clk,
    rst => rst,
    zenb => sel
);

U2: multiplexor port map (
    A => "0010",
    B => "0000",
    C => "0100",
    D => "----",
    sel => sel,
    O => bin
);

U3: multiplexor port map (
    A => "0101",
    B => "1011",
    C => "1110",
    D => "----",
    sel => sel,
    O => an
);

U4: zazpi_segmentu port map (
    bin => bin,
    display => "----",
    seg => seg
);



end Behavioral;
