----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.05.2024 09:19:03
-- Design Name: 
-- Module Name: em - Behavioral
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

entity em is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           organo : in STD_LOGIC;
           incienso : in STD_LOGIC;
           canto : out STD_LOGIC;
           risa : out STD_LOGIC);
end em;

architecture Behavioral of em is
signal s_canto, s_risa, canto_next, risa_next: std_logic;
begin
canto <= s_canto;
risa <= s_risa;

canto_next <= s_canto xor (not s_risa and organo);
risa_next <= incienso xor s_canto;

process(clk, rst)
begin
    if rst = '1' then
        s_canto <= '1';
        s_risa <= '1';
    elsif rising_edge(clk) then
        s_canto <= canto_next;
        s_risa <= risa_next;
    end if;
end process;

end Behavioral;
