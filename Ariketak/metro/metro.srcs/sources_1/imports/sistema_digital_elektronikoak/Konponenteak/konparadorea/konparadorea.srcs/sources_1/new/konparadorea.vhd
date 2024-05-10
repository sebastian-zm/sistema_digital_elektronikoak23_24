----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2024 16:31:42
-- Design Name: 
-- Module Name: konparadorea - Behavioral
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
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity konparadorea is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           GT : out STD_LOGIC;
           EQ : out STD_LOGIC;
           LO : out STD_LOGIC);
end konparadorea;

architecture Behavioral of konparadorea is

begin

EQ <= '1' when A=B else '0';
GT <= '1' when A>B else '0';
LO <= '1' when A<B else '0';

end Behavioral;
