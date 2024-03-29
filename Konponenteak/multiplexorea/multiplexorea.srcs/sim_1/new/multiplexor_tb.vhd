----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2024 11:15:50
-- Design Name: 
-- Module Name: multiplexor_tb - Behavioral
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



entity multiplexor_tb is
--  Port ( );
end multiplexor_tb;

architecture Behavioral of multiplexor_tb is

component multiplexor is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;
           SEL : in STD_LOGIC_VECTOR (1 downto 0);
           O: out STD_LOGIC);
end component;

signal A, B, C, D, O: std_logic;
signal SEL: std_logic_vector(1 downto 0);

begin

DUT: multiplexor port map (
    A => A,
    B => B,
    C => C,
    D => D,
    SEL => SEL,
    O => O
);

stim_proc: process
variable sarrerak: STD_LOGIC_VECTOR(5 downto 0);
begin
    for i in 0 to 63 loop
        sarrerak := std_logic_vector(to_unsigned(i, 6));
        SEL <= sarrerak(5 downto 4);
        A <= sarrerak(3);
        B <= sarrerak(2);
        C <= sarrerak(1);
        D <= sarrerak(0);
        wait for 5 ns;
    end loop;
    
    wait;
end process;

end Behavioral;
