----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.02.2024 12:31:21
-- Design Name: 
-- Module Name: ureztatze_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ureztatze_tb is
--  Port ( );
end ureztatze_tb;


architecture Behavioral of ureztatze_tb is

component ureztatze is
    Port ( S : in STD_LOGIC;
           R : in STD_LOGIC;
           D : in STD_LOGIC;
           V : in STD_LOGIC;
           B : out STD_LOGIC);
end component;

signal S, R, D, V, B: std_logic;
begin

DUT: ureztatze port map (
    S => S,
    R => R,
    D => D,
    V => V,
    B => B
);

stim_proc: process
    variable sarrerak : std_logic_vector(3 downto 0);
begin

    for sarrerak_n in 0 to 15 loop
        sarrerak := std_logic_vector(to_unsigned(sarrerak_n, 4));
        S <= sarrerak (0);
        R <= sarrerak (1);
        D <= sarrerak (2);
        V <= sarrerak (3);
        wait for 10 ns;
    end loop;
    
    wait;

end process;

end Behavioral;
