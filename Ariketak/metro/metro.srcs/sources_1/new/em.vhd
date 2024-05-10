----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.05.2024 11:48:45
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity em is
    Port ( txartel : in STD_LOGIC_VECTOR (1 downto 0);
           irekita : in STD_LOGIC;
           itxita : in STD_LOGIC;
           fotozelula : in STD_LOGIC;
           kont2_end : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           ireki : out STD_LOGIC;
           itxi : out STD_LOGIC;
           bin : out STD_LOGIC_VECTOR(3 downto 0);
           kont_en2 : out STD_LOGIC;
           kont_en5 : out STD_LOGIC);
end em;

architecture Behavioral of em is

type egoera is (itxaroten, error, ixten, tmp, pasatzen);
signal oraingoa, hurrengoa: egoera;
signal n: std_logic_vector(3 downto 0);

begin

process(clk,rst)
begin
    if rst='1' then
        oraingoa <= itxaroten;
        n <= "0000";
    elsif clk'event and clk='1' then
        oraingoa <= hurrengoa;
        if n < 9 and oraingoa = tmp then
            n <= n + 1;
        end if;
    end if;
end process;

process(txartel,itxita,irekita,fotozelula,kont2_end,oraingoa)
begin
    ireki <= '0';
    itxi <= '0';
    kont_en2 <= '0';
    kont_en5 <= '0';
    bin <= n;
    hurrengoa <= oraingoa;
    case oraingoa is
        when itxaroten =>
            itxi <= not itxita;
            if txartel = "10" then
                hurrengoa <= error;
            elsif txartel = "11" then
                hurrengoa <= pasatzen;
            end if;
        when error =>
            itxi <= not itxita;
            kont_en2 <= '1';
            bin <= "1110";
            if kont2_end='1' then
                hurrengoa <= itxaroten;
            end if;
        when pasatzen =>
            ireki <= not irekita;
            kont_en5 <= '1';
            if fotozelula = '1' then
                hurrengoa <= tmp;
            end if;
        when tmp =>
            ireki <= not irekita;
            hurrengoa <= ixten;
        when ixten =>
            itxi <= '1';
            kont_en5 <= '1';
            if itxita = '1' then
                hurrengoa <= itxaroten;
            end if;
    end case;
end process;

end Behavioral;
