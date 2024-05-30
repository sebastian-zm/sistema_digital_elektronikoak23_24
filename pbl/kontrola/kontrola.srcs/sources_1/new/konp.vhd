----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.05.2024 10:33:22
-- Design Name: 
-- Module Name: konp - Behavioral
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

entity konp is
    Port ( BTN : in STD_LOGIC_VECTOR (2 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           complete : in STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (7 downto 0);
           send_char : out STD_LOGIC);
end konp;

architecture Behavioral of konp is

signal btn_bin, new_btn_bin: std_logic_vector (1 downto 0);
component multiplexor is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           C : in STD_LOGIC_VECTOR (7 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           SEL : in STD_LOGIC_VECTOR (1 downto 0);
           O: out STD_LOGIC_VECTOR (7 downto 0));
end component;
component lehentasun_kod is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           I : out STD_LOGIC_VECTOR (1 downto 0));
end component;
begin

send_char <= '1';

process
begin
    if rst = '1' then
    elsif clk'event and clk = '1' then
        if complete = '1' then
            btn_bin <= new_btn_bin;
        end if;
    end if;
end process;

lk: lehentasun_kod port map (
    S => BTN,
    I => new_btn_bin
);

mux: multiplexor port map (
    A => "00000000",
    B => "01000001",
    C => "01000100",
    D => "01011111",
    sel => btn_bin,
    O => data_out
);

end Behavioral;
