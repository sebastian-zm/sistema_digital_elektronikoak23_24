----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.05.2024 12:38:40
-- Design Name: 
-- Module Name: top_tb - Behavioral
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

entity top_tb is
--  Port ( );
end top_tb;

architecture Behavioral of top_tb is
signal clk, rst, irekita, itxita, fotozelula, ireki, itxi, alarma: std_logic;
signal txartel: std_logic_vector(1 downto 0);
signal seg: std_logic_vector(6 downto 0);
signal an: std_logic_vector(3 downto 0);
component top is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           txartel : in STD_LOGIC_VECTOR (1 downto 0);
           irekita : in STD_LOGIC;
           itxita : in STD_LOGIC;
           fotozelula : in STD_LOGIC;
           ireki : out STD_LOGIC;
           itxi : out STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           alarma : out STD_LOGIC);
end component;
begin
dut: top port map (
    clk => clk,
    rst => rst,
    txartel => txartel,
    irekita => irekita,
    itxita => itxita,
    fotozelula => fotozelula,
    ireki => ireki,
    itxi => itxi,
    seg => seg,
    an => an,
    alarma => alarma
);

process
begin
    rst <= '1';
    txartel <= "00";
    irekita <= '0';
    itxita <= '1';
    fotozelula <= '0';
    wait for 5 ns;
    rst <= '0';
    wait for 20 ns;
    txartel <= "11";
    wait for 20 ns;
    txartel <= "00";
    irekita <= '1';
    wait for 20 ns;
    fotozelula <= '1';
    wait for 20 ns;
    fotozelula <= '0';
    txartel <= "10";
    wait for 20 ns;
    txartel <= "01";
    wait;
end process;

process
begin
clk <= '0';
wait for 5 ns;
clk <= '1';
wait for 5 ns;
end process;


end Behavioral;
