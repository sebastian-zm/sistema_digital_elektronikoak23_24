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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity konparadorea is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           GT : out STD_LOGIC;
           EQ : out STD_LOGIC;
           LT : out STD_LOGIC);
end konparadorea;

architecture Behavioral of konparadorea is

signal eqv, gtv: std_logic_vector(4 downto 0);

begin

gtv(4) <= '0';
eqv(4) <= '1';

forloop: for i in 0 to 3 generate
    eqv(i) <= eqv(i + 1) and (A(i) xnor B(i));
    gtv(i) <= gtv(i + 1) or (eqv(i + 1) and A(i) and not B(i));
end generate forloop;

EQ <= eqv(0);
GT <= gtv(0);
LT <= not (eqv(0) or gtv(0));

end Behavioral;
