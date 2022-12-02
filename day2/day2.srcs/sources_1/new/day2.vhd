----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2022 13:36:46
-- Design Name: 
-- Module Name: day2 - Behavioral
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity day2 is
    Port ( inA : in unsigned(1 downto 0);
           inB : in unsigned(1 downto 0);
           CLK : in STD_LOGIC;
           output : out unsigned(18 downto 0);
           output2 : out unsigned(18 downto 0));
end day2;

architecture Behavioral of day2 is

signal sel: unsigned(3 downto 0);
signal muxout: integer := 0;
signal muxout2: integer := 0;
signal acc: integer := 0;
signal acc2: integer := 0;

begin

output <= TO_UNSIGNED(acc, 19);
output2 <= TO_UNSIGNED(acc2, 19);

process(clk)
begin
    if rising_edge(CLK) then
        sel(3 downto 2) <= inA;
        sel(1 downto 0) <= inB;
        acc <= acc + muxout;
        acc2 <= acc2 + muxout2;
    end if;
end process;

with sel select
    muxout <= 4 when "0000",
              8 when "0001",
              3 when "0010",
              1 when "0100",
              5 when "0101",
              9 when "0110",
              7 when "1000",
              2 when "1001",
              6 when "1010",
              0 when others;

with sel select
    muxout2 <= 3 when "0000",
              4 when "0001",
              8 when "0010",
              1 when "0100",
              5 when "0101",
              9 when "0110",
              2 when "1000",
              6 when "1001",
              7 when "1010",
              0 when others;          

end Behavioral;
