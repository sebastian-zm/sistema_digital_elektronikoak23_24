----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.04.2024 12:00:09
-- Design Name: 
-- Module Name: EM - Behavioral
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

entity EM is
    Port ( atea : in STD_LOGIC;
           interruptorea : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           argia : out STD_LOGIC;
           magnetroia : out STD_LOGIC);
end EM;

architecture Behavioral of EM is

component lehentasun_kod is
    Port ( S : in STD_LOGIC_VECTOR (6 downto 0);
           I : out STD_LOGIC_VECTOR (2 downto 0));
end component;

type egoera is (irekita, itxita, martxan);
signal q: egoera;
signal q1: egoera;
signal q1_irekita: egoera;
signal q1_itxita: egoera;
signal q1_martxan: egoera;
signal magnetroia_martxan: STD_LOGIC_VECTOR(2 downto 0);
begin

sek: process(clk, rst)
begin
    if rst = '1' then
        q <= irekita;
    elsif clk'event and clk = '1' then
        q <= q1;
    end if;
end process;

q1_irekita <= itxita when atea = '1' else irekita;

q1_itxita <= irekita when atea = '0' else
             martxan when interruptorea = '1' else
             itxita;
             
q1_martxan <= irekita when atea = '0' else
              itxita when interruptorea = '0' else
              martxan;


with q select
    q1 <= q1_itxita when itxita,
          q1_martxan when martxan,
          q1_irekita when others;


magnetroia <= '1' when q = martxan else
              '0';
argia <= '1' when q = irekita or q = martxan else
         '0';

end Behavioral;
