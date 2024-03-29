----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2024 11:59:51
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
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC_VECTOR (3 downto 0);
           D : in STD_LOGIC_VECTOR (3 downto 0);
           SEL : in STD_LOGIC_VECTOR (1 downto 0);
           O: out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal A, B, C, D, O: STD_LOGIC_VECTOR (3 downto 0);
signal SEL: STD_LOGIC_VECTOR (1 downto 0);
begin

DUT: multiplexor port map (
    A => A,
    B => B,
    C => C,
    D => D,
    O => O,
    SEL => SEL
);

stim_proc: process
variable sarrerak: STD_LOGIC_VECTOR(17 downto 0);
begin
    for i in 0 to 2**18-1 loop
        sarrerak := STD_LOGIC_VECTOR(to_unsigned(i, 18));
        SEL <= sarrerak (17 downto 16);
        A <= sarrerak (15 downto 12);
        B <= sarrerak (11 downto 8);
        C <= sarrerak (7 downto 4);
        D <= sarrerak (3 downto 0);
        wait for 1 ps;
    end loop;
end process;

end Behavioral;
