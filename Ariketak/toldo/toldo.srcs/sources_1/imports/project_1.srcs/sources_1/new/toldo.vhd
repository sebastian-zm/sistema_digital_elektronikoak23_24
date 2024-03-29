----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.02.2024 11:55:51
-- Design Name: 
-- Module Name: toldo - Behavioral
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

entity toldo is
    Port ( S : in STD_LOGIC;
           L : in STD_LOGIC;
           V : in STD_LOGIC;
           F : in STD_LOGIC;
           BTsop : out STD_LOGIC;
           BTpos : out STD_LOGIC);
end toldo;

architecture Behavioral of toldo is
    signal prod1 : std_logic;
    signal prod2 : std_logic;
    signal sum1 : std_logic;
    signal sum2 : std_logic;
begin
    prod1 <= S and not F;
    prod2 <= not S and V;
    BTsop <= L or prod1 or prod2;

    sum1 <= V or S or L;
    sum2 <= not S or not F;
    BTpos <= sum1 and sum2;
end Behavioral;
