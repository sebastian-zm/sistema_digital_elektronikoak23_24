----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2024 12:25:11
-- Design Name: 
-- Module Name: jk_ff - Behavioral
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

entity jk_ff is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           j : in STD_LOGIC;
           k : in STD_LOGIC;
           q : out STD_LOGIC;
           qbar : out STD_LOGIC);
end jk_ff;

architecture Behavioral of jk_ff is
signal q_next: std_logic;
signal qbar_next: std_logic;
signal s_q: std_logic;
signal s_qbar: std_logic;
signal jk: std_logic_vector (1 downto 0);
begin

jk <= j & k;

q <= s_q;
qbar <= s_qbar;

with jk select
    q_next <= s_q when "00",
              s_qbar when "11",
              '1' when "10",
              '0' when others;
with jk select
    qbar_next <= s_qbar when "00",
                 s_q when "11",
                 '0' when "10",
                 '1' when others;

process(clk)
begin
    if rst = '1' then
        s_q <= '1';
        s_qbar <= '0';
    elsif clk'event and clk = '1' then
        s_q <= q_next;
        s_qbar <= qbar_next;
    end if;
end process;

end Behavioral;
