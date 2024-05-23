----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.05.2024 15:40:26
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port ( A : in STD_LOGIC;
           Ao : out STD_LOGIC;
           B : in STD_LOGIC;
           Bo : out STD_LOGIC;
           C : in STD_LOGIC;
           Co : out STD_LOGIC;
           D : in STD_LOGIC;
           Do : out STD_LOGIC;
           JC: out STD_LOGIC_VECTOR(7 downto 4)
           );
end top;

architecture Behavioral of top is

begin

Ao <= A;
Bo <= B;
Co <= C;
Do <= D;
JC <= (
    others => 'Z'
);

end Behavioral;
