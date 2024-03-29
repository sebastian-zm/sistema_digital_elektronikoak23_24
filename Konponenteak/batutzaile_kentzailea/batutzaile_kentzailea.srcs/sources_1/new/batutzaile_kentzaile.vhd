----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2024 15:12:02
-- Design Name: 
-- Module Name: batutzaile_kentzaile - Behavioral
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

entity batutzaile_kentzaile is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           overflow: out STD_LOGIC;
           Cout : out STD_LOGIC);
end batutzaile_kentzaile;

architecture Behavioral of batutzaile_kentzaile is

signal C: STD_LOGIC_VECTOR (4 downto 0);
signal Bsum: STD_LOGIC_VECTOR (3 downto 0);

component full_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end component;

begin

C(0) <= M;
Cout <= C(4);
overflow <= C(4) xor C(3);

Bsumloop: for ii in 0 to 3 generate
    Bsum(ii) <= M xor B(ii);
end generate Bsumloop;

fa: for ii in 0 to 3 generate
    fa_i: full_adder port map (
        A => A(ii),
        B => Bsum(ii),
        S => S(ii),
        Cin => C(ii),
        Cout => C(ii + 1)
    );
end generate fa;

end Behavioral;
