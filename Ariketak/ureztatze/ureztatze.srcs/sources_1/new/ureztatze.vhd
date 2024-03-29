----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.02.2024 12:27:47
-- Design Name: 
-- Module Name: ureztatze - Behavioral
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

entity ureztatze is
    Port ( S : in STD_LOGIC;
           R : in STD_LOGIC;
           D : in STD_LOGIC;
           V : in STD_LOGIC;
           B : out STD_LOGIC);
end ureztatze;

architecture Behavioral of ureztatze is

begin
    B <= S and not V and (not R or not D);
end Behavioral;
