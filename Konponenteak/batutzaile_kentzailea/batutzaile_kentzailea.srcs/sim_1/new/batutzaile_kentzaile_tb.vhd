----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2024 15:22:54
-- Design Name: 
-- Module Name: batutzaile_kentzaile_tb - Behavioral
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

entity batutzaile_kentzaile_tb is
--  Port ( );
end batutzaile_kentzaile_tb;

architecture Behavioral of batutzaile_kentzaile_tb is

component batutzaile_kentzaile is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           overflow: out STD_LOGIC;
           Cout : out STD_LOGIC);
end component;

signal A, B, S: STD_LOGIC_VECTOR(3 downto 0);
signal M, Cout, overflow: STD_LOGIC;
signal SARRERA: STD_LOGIC_VECTOR(8 downto 0);

begin

M <= SARRERA(8);
B <= SARRERA(7 downto 4);
A <= SARRERA(3 downto 0);

dut: batutzaile_kentzaile port map (
    A => A,
    B => B,
    M => M,
    S => S,
    Cout => Cout,
    overflow => overflow
);

stim_proc: process

begin
    for ii in 0 to 2**9-1 loop
        SARRERA <= STD_LOGIC_VECTOR(TO_UNSIGNED(ii, 9));
        wait for 1 ns;
    end loop;
    
    wait;
end process;


end Behavioral;
