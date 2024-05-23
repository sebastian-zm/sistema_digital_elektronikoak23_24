----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.05.2024 10:38:09
-- Design Name: 
-- Module Name: em1 - Behavioral
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

entity em1 is
    Port ( BTNU : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           amaituta : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           boom : out STD_LOGIC;
           off : out STD_LOGIC;
           kont_en : out STD_LOGIC);
end em1;

architecture Behavioral of em1 is

signal oraingoa, hurrengoa : STD_LOGIC_VECTOR(1 downto 0);

begin

process(clk,rst)
begin
    if rst = '1' then
        oraingoa <= "00";
    elsif clk'event and clk = '1' then
        oraingoa <= hurrengoa;
    end if;
end process;

process(oraingoa, btnu, btnc, amaituta)
begin
    hurrengoa <= oraingoa;
    off <= '0';
    boom <= '0';
    kont_en <= '0';
    case oraingoa is
        when "00" =>
            if btnc = '1' then
                hurrengoa <= "01";
            end if;
        when "01" =>
            kont_en <= '1';
            if btnu = '1' then
                hurrengoa <= "10";
            elsif amaituta = '1' then
                hurrengoa <= "11";
            end if;
        when "10" =>
            off <= '1';
        when others =>
            boom <= '1';
    end case;
end process;


end Behavioral;
