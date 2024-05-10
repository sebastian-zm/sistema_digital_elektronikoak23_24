----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2024 14:51:56
-- Design Name: 
-- Module Name: edge_detect - Behavioral
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

entity edge_detect is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           S : in STD_LOGIC;
           rising : out STD_LOGIC;
           falling : out STD_LOGIC);
end edge_detect;

architecture Behavioral of edge_detect is
signal s_prev, s_prev_prev: std_logic;
begin

rising <= s_prev and not s_prev_prev;
falling <= not s_prev and s_prev_prev;
process(clk, rst)
begin
    if rst = '1' then
        s_prev_prev <= '0';
        s_prev <= '0';
    elsif clk'event and clk = '1' then
        s_prev_prev <= s_prev;
        s_prev <= S;
    end if;
end process;

end Behavioral;
