----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.03.2024 10:33:49
-- Design Name: 
-- Module Name: add_4bit_tb - Behavioral
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

entity add_4bit_tb is
--  Port ( );
end add_4bit_tb;

architecture Behavioral of add_4bit_tb is
component add_4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (4 downto 0));
end component;

signal A, B: std_logic_vector(3 downto 0);
signal S: std_logic_vector(4 downto 0);

signal sarrera: std_logic_vector(7 downto 0);

begin

A <= sarrera(7 downto 4);
B <= sarrera(3 downto 0);

dut: add_4bit port map (
    A => A,
    B => B,
    S => S
);

stim_proc: process
begin
    for ii in 0 to 2**8-1 loop
        sarrera <= std_logic_vector(to_unsigned(ii, 8));
        wait for 100 ps;
    end loop;

    wait;

end process;


end Behavioral;
