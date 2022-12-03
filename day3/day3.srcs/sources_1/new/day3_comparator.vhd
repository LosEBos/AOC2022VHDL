----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Eric Bergdahl
-- 
-- Create Date: 03.12.2022 11:38:22
-- Design Name: 
-- Module Name: day3_comparator - Behavioral
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

entity day3_comparator is
    Port ( a_in : in STD_LOGIC_VECTOR (7 downto 0);
           b_in : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0));
end day3_comparator;    

architecture Behavioral of day3_comparator is

signal compareout : STD_LOGIC_VECTOR(8 downto 0);
signal andStep: STD_LOGIC := '0';

begin

compareout <= a_in XNOR b_in;
andStep <= AND compareout;

with andStep select
    output <= a_in when '1',
              x"00" when others;
    


end Behavioral;
