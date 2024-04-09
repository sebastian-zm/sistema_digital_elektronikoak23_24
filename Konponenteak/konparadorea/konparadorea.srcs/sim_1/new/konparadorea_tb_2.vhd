----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2024 17:30:46
-- Design Name: 
-- Module Name: konparadorea_tb_2 - Behavioral
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

entity konparadorea_tb_2 is
--  Port ( );
end konparadorea_tb_2;

architecture Behavioral of konparadorea_tb_2 is
component konparadorea is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           GT : out STD_LOGIC;
           EQ : out STD_LOGIC;
           LO : out STD_LOGIC);
end component;
signal GT, EQ, LT: std_logic;
signal A, B: std_logic_vector(2 downto 0);
signal sarrerak: std_logic_vector(5 downto 0);
begin

A <= sarrerak(5 downto 3);
B <= sarrerak(2 downto 0);

DUT: konparadorea port map (
    A => A,
    B => B,
    GT => GT,
    EQ => EQ,
    LO => LT
);

stim_proc: process
begin
    for i in 0 to 2**6-1 loop
        sarrerak <= std_logic_vector(to_unsigned(i, 6));
        
        wait for 10 ns;
    end loop;
    
    wait;
end process;

end Behavioral;
