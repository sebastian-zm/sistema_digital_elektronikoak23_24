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
           btn_on: in STD_LOGIC;
           btn_off: in STD_LOGIC;
           amaituta : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           argia : out STD_LOGIC;
           kont_enable : out STD_LOGIC;
           magnetroia : out STD_LOGIC);
end EM;

architecture Behavioral of EM is

type egoera is (irekita, itxita, martxan);
signal q: egoera;
signal q1: egoera;
signal q1_irekita: egoera;
signal q1_itxita: egoera;
signal q1_martxan: egoera;
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
             martxan when btn_on = '1' else
             itxita;
             
q1_martxan <= irekita when atea = '0' else
              itxita when btn_off = '1' or amaituta = '1' else
              martxan;


with q select
    q1 <= q1_itxita when itxita,
          q1_martxan when martxan,
          q1_irekita when others;


magnetroia <= '1' when q = martxan else
              '0';
argia <= '0' when q = itxita else
         '1';
kont_enable <= '1' when q = martxan else
               '0';

end Behavioral;
