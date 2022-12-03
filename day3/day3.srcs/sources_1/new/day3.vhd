----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2022 11:35:41
-- Design Name: 
-- Module Name: day3 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

use STD.textio.all;
use ieee.std_logic_textio.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;



entity day3 is
    Port ( input1 : in STD_LOGIC_VECTOR (23*8-1 downto 0);
           input2 : in STD_LOGIC_VECTOR (23*8-1 downto 0);
           output : out unsigned(18 downto 0);
           clk : in STD_LOGIC);
end day3;

architecture Behavioral of day3 is
type outputArray is array (0 to 528) of std_logic_vector(7 downto 0);

signal outArr : outputArray;
signal outVal : unsigned(7 downto 0) := (others => '0');

signal add: unsigned(7 downto 0) := (others => '0');

signal count: unsigned(18 downto 0) := (others => '0');
signal fulhack: outputArray;

component day3_comparator is
    Port ( a_in : in STD_LOGIC_VECTOR (7 downto 0);
           b_in : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0));
end component day3_comparator;


begin

    GEN_COMPARATOR_OUT:
    for i in 0 to 22 generate
        GEN_COMPARATOR:
        for j in 0 to 22 generate
            COMPARATOR:
            day3_comparator port map(
                a_in => input1(i*8 + 7 downto i*8), b_in => input2(j*8 + 7 downto j*8), output => outArr(i*23 + j)
            );
        end generate;
    end generate;
    
 --   process
 --   begin
 --       outVal <= (others => '0');
 --       for k in 0 to 528 loop
 --           outVal <= outVal OR unsigned(outArr(k));
 --       end loop;
 --       wait for 1ns;
--
 --   end process;
 
 fulhack(0) <= outArr(0);
 
 addARR: for p in 1 to 528 generate
    fulhack(p) <= fulhack(p-1) OR outArr(p);
end generate;

outVal <= unsigned(fulhack(528));    
    
   process(clk)
    begin
    if rising_edge(CLK) then
        count <= count + add;
        end if;
    end process;
    
with outVal(5) select
    add <= unsigned(outVal) - x"26" when '0',
           unsigned(outVal) - x"60" when '1',
           x"00" when others;
           
output <= count;           

end Behavioral;
