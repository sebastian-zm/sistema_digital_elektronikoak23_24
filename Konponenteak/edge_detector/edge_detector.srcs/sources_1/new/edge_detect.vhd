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

signal s_prev, rising_next, falling_next, clk_b: std_logic;
begin

rising_next <= S and not s_prev;
falling_next <= not S and s_prev;

process(clk_b, rst)
begin
    if rst = '1' then
        rising <= '0';
        falling <= '0';
        s_prev <= S;
    elsif clk'event and clk = '1' then
        s_prev <= S;
        rising <= rising_next;
        falling <= falling_next;
    end if;
end process;

end Behavioral;
