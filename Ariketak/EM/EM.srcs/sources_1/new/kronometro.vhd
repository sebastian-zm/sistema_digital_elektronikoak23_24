----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.04.2024 11:04:56
-- Design Name: 
-- Module Name: kronometro - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity kronometro is
    Port ( denbora : in STD_LOGIC_VECTOR (3 downto 0);
           set : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause: in STD_LOGIC;
           clk : in STD_LOGIC;
           bukatuta : out STD_LOGIC;
           denbora_out : out STD_LOGIC_VECTOR (3 downto 0));
end kronometro;

architecture Behavioral of kronometro is

signal s_denbora : STD_LOGIC_VECTOR (3 downto 0);
begin

denbora_out <= s_denbora;

process(clk, set, rst)
begin
    if (rst = '1') then
        bukatuta <= '1';
        s_denbora <= (others => '0');
    elsif (set = '1') then
        bukatuta <= '0';
        s_denbora <= denbora;
    elsif (clk'event and clk = '1') then
        if (s_denbora = 0) then
            bukatuta <= '0';
            s_denbora <= (others => '0');
        elsif (pause = '1') then
            bukatuta <= '0';
            s_denbora <= s_denbora;
        elsif s_denbora = 1 then
            bukatuta <= '1';
            s_denbora <= s_denbora - 1;
        else
            bukatuta <= '0';
            s_denbora <= s_denbora - 1;
        end if;
    else
        s_denbora <= s_denbora;
    end if;
end process;
end Behavioral;
