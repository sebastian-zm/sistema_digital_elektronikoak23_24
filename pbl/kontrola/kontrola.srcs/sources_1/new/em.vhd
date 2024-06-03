----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 31.05.2023 08:28:14
-- Design Name:
-- Module Name: Egoera_Makina_Botoiak - Behavioral
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
 
entity Egoera_Makina is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           BTND : in STD_LOGIC;
           BTNU : in STD_LOGIC;
           BTNR : in STD_LOGIC;
           BTNC: in std_logic;
           BTNL : in STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (7 downto 0);
           send_char : out STD_LOGIC;
           tx_complete : in STD_LOGIC);
end Egoera_Makina;
 
architecture Behavioral of Egoera_Makina is
 
type egoera is (HASIERA, AURRERA, AURRERA_ITX, ATZERA, ATZERA_ITX, ESKUINERA, ESKUINERA_ITX, EZKERRERA, EZKERRERA_ITX, GELDITU, AMAITU, AMAITU_ITX);
signal oraingoa, hurrengoa: egoera;
 
begin
 
sek: process (rst, clk, hurrengoa)
begin
    if rst='1' then --memoria
        oraingoa<=HASIERA;
    elsif clk' event and clk='1' then
        oraingoa<=hurrengoa;
    end if;
end process;
 
konb: process(oraingoa, BTNR, BTNL, BTND, BTNU, tx_complete)
begin

data_out<="00000000";
send_char<='0';
hurrengoa<=oraingoa;
case oraingoa is

    when HASIERA=>
        if (BTNU='1') then
            hurrengoa<=AURRERA;
        elsif (BTND='1') then
            hurrengoa<=ATZERA;
        elsif (BTNR='1') then
            hurrengoa<=ESKUINERA;
        elsif (BTNL='1') then
            hurrengoa<=EZKERRERA;
        elsif (BTNC='1') then
            hurrengoa<= AMAITU;
        end if;

    when AURRERA=>
        send_char <= '1';
        data_out<="01010111";--W en la tabla ASCII
        if tx_complete = '1' then
            hurrengoa<=AURRERA_ITX;
        end if;

    when AURRERA_ITX=>
        if BTNU='0' then
            hurrengoa <= GELDITU;
        end if;
 
    when ATZERA=>
        send_char <= '1';
        data_out<="01010011";--S en la tabla ASCII
        if tx_complete = '1' then
            hurrengoa<=ATZERA_ITX;
        end if;

    when ATZERA_ITX=>
        if (BTND='0') then
            hurrengoa<=GELDITU;
        end if;

    when ESKUINERA=>
        send_char <= '1';
        data_out<="01000100";--D en la tabla ASCII
        if tx_complete = '1' then
            hurrengoa<=ESKUINERA_ITX;
        end if;

    when ESKUINERA_ITX=>
        if (BTNR='0') then
            hurrengoa<=GELDITU;
        end if;

    when EZKERRERA=>
        send_char <= '1';
        data_out<="01000001";--A en la tabla ASCII
        if tx_complete = '1' then
            hurrengoa<=EZKERRERA_ITX;
        end if;

    when EZKERRERA_ITX=>
        if (BTNL='0') then
            hurrengoa<=GELDITU;
        end if;
 
    when GELDITU=>
        send_char <= '1';
        data_out<="01010000";--P en la tabla ASCII
        if tx_complete = '1' then
            hurrengoa<=HASIERA;
        end if;
 
    when AMAITU=>
        send_char<='1';
        data_out<="01000010";--B en la tabla ASCII
        if tx_complete = '1' then
            hurrengoa<=AMAITU_ITX;
        end if;

    when AMAITU_ITX=>
        if (BTNC='0') then
            hurrengoa<=HASIERA;
        end if;
 
    when OTHERS=>
        hurrengoa<=HASIERA;
 
end case;
end process;
 
end Behavioral;