----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.04.2024 14:28:26
-- Design Name: 
-- Module Name: kont - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.MATH_REAL.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity kont is
    Generic (
        n: natural := 100_000_000
    );
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           enable : in STD_LOGIC;
           ended : out STD_LOGIC;
           zenb : out STD_LOGIC_VECTOR (integer(ceil(log2(real(n)+0.5))) downto 0));
end kont;

architecture Behavioral of kont is


signal s_zenb, s_zenb_next: STD_LOGIC_VECTOR (integer(ceil(log2(real(n)+0.5))) downto 0);
begin
zenb <= s_zenb;
s_zenb_next <= (others => '0') when enable = '0' else
               s_zenb + 1 when s_zenb < n else
               s_zenb;
ended <= '0' when s_zenb < n else '1';

process(clk,rst)
begin
    if (rst = '1') then
        s_zenb <= (others => '0');
    elsif (clk'event and clk = '1') then
        s_zenb <= s_zenb_next;
    end if;
end process;

end Behavioral;
