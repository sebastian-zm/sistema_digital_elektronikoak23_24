----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.05.2024 10:34:03
-- Design Name: 
-- Module Name: zenb_mem - Behavioral
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
use IEEE.STD_LOGIC_SIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity zenb_mem is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           diff : in STD_LOGIC_VECTOR (3 downto 0);
           enable : in STD_LOGIC;
           zenb : out STD_LOGIC_VECTOR (3 downto 0));
end zenb_mem;

architecture Behavioral of zenb_mem is

signal s_zenb: STD_LOGIC_VECTOR(3 downto 0);

begin

zenb <= s_zenb;

process(clk, rst)
begin
    if (rst = '1') then
        s_zenb <= "0000";
    elsif clk'event and clk = '1' then
        if enable = '1' then
            s_zenb <= s_zenb + diff;
        else
            s_zenb <= "0000";
        end if;
    end if;
end process;


end Behavioral;
