----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2024 13:14:14
-- Design Name: 
-- Module Name: abs_sis - Behavioral
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

entity abs_sis is
    Port ( Balazta : in STD_LOGIC;
           Birak : in STD_LOGIC;
           Martxan : in STD_LOGIC;
           Enable : in STD_LOGIC;
           Aktibatuta : out STD_LOGIC;
           Pintzak : out STD_LOGIC);
end abs_sis;

architecture Behavioral of abs_sis is

begin

Aktibatuta <= Martxan and Balazta and not Birak and Enable;
Pintzak <= Balazta and (not Martxan or not Enable or Birak);

end Behavioral;
