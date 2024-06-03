----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.05.2024 10:19:24
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
    Port ( BTND : in STD_LOGIC;
           BTNU : in STD_LOGIC;
           BTNR : in STD_LOGIC;
           BTNC: in std_logic;
           BTNL : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           RxD : out STD_LOGIC;
           TxD : in STD_LOGIC;
           inp: out STD_LOGIC_VECTOR (5 downto 0));
end top;

architecture Behavioral of top is
signal btn_bin: std_logic_vector(1 downto 0);
signal send_character, s_16x_baud, Tx_complete: std_logic;
signal data_in: std_logic_vector(7 downto 0);
component kcuart_tx is
    Port (        data_in : in std_logic_vector(7 downto 0);
           send_character : in std_logic;
             en_16_x_baud : in std_logic;
               serial_out : out std_logic;
              Tx_complete : out std_logic;
                      clk : in std_logic);
end component;
component Egoera_Makina is
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
end component;
component baud_16x is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           O : out STD_LOGIC);
end component;
begin
inp <= (others => 'Z');
baud_x16: baud_16x port map (
    clk => clk,
    rst => rst,
    O => s_16x_baud
);
em: Egoera_Makina port map (
    BTND => BTND,
    BTNU => BTNU,
    BTNR => BTNR,
    BTNC => BTNC,
    BTNL => BTNL,
    clk => s_16x_baud,
    rst => rst,
    tx_complete => Tx_complete,
    data_out => data_in,
    send_char => send_character
);
tx: kcuart_tx port map (
    data_in => data_in,
    send_character => send_character,
    en_16_x_baud => '1',
    clk => s_16x_baud,
    serial_out => RxD,
    Tx_complete => Tx_complete
);

end Behavioral;
