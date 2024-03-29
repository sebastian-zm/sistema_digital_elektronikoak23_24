----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.02.2024 12:10:35
-- Design Name: 
-- Module Name: toldo_tb - Behavioral
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

entity toldo_tb is
    --Port ();
end toldo_tb;

architecture Behavioral of toldo_tb is
component toldo
    Port ( S : in STD_LOGIC;
           L : in STD_LOGIC;
           V : in STD_LOGIC;
           F : in STD_LOGIC;
           BTpos : out STD_LOGIC;
           BTsop : out STD_LOGIC);
end component;

signal S, L, V, F: std_logic;
signal BTpos: std_logic;
signal BTsop: std_logic;
begin

dut: toldo port map (
S => S,
L => L,
V => V,
F => F,
BTpos => BTpos,
BTsop => BTsop
);

stim_s: process
begin
S <= '0';
wait for 10 ns;
S <= '1';
wait for 10 ns;
end process;

stim_l: process
begin
L <= '0';
wait for 20 ns;
L <= '1';
wait for 20 ns;
end process;

stim_v: process
begin
V <= '0';
wait for 40 ns;
V <= '1';
wait for 40 ns;
end process;

stim_f: process
begin
F <= '0';
wait for 80 ns;
F <= '1';
wait for 80 ns;
end process;

--stim_proc: process
--variable SARRERA_V: std_logic_vector(3 downto 0);
--begin
--for SARRERA_I in 0 to 15 loop
--    SARRERA_V := std_logic_vector(to_unsigned(SARRERA_I, 4));
--    S <= SARRERA_V (0);
--    L <= SARRERA_V (1);
--    V <= SARRERA_V (2);
--    F <= SARRERA_V (3);
--    wait for 10 ns;
--end loop;

--wait;
--end process;

end Behavioral;
