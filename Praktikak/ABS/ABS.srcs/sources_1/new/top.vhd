----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2024 13:28:42
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
    Port ( Balazta : in STD_LOGIC;
           Enable : in STD_LOGIC;
           Birak : in STD_LOGIC_VECTOR (3 downto 0);
           Argi : out STD_LOGIC;
           Pintzak : out STD_LOGIC_VECTOR (3 downto 0));
end top;

architecture Behavioral of top is

component Martxan is
    Port ( Birak : in STD_LOGIC_VECTOR (3 downto 0);
           Martxan : out STD_LOGIC);
end component;

component abs_sis is
    Port ( Balazta : in STD_LOGIC;
           Birak : in STD_LOGIC;
           Martxan : in STD_LOGIC;
           Enable : in STD_LOGIC;
           Aktibatuta : out STD_LOGIC;
           Pintzak : out STD_LOGIC);
end component;

component argia is
    Port ( Martxan : in STD_LOGIC;
           Aktibatuta : in STD_LOGIC_VECTOR (3 downto 0);
           Argia : out STD_LOGIC);
end component;

signal abs_argi: STD_LOGIC_VECTOR (3 downto 0);
signal martxa: STD_LOGIC;

begin

martx: Martxan port map (
    Birak => Birak,
    Martxan => martxa
);

arg: argia port map (
    Martxan => martxa,
    Aktibatuta => abs_argi,
    Argia => Argi
);

absloop: for i in 0 to 3 generate
    abssis: abs_sis port map (
        Birak => Birak(i),
        Martxan => martxa,
        Balazta => Balazta,
        Enable => Enable,
        Aktibatuta => abs_argi(i),
        Pintzak => Pintzak(i)
    );
end generate absloop;

end Behavioral;
