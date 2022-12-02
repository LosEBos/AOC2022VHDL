----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.12.2022 20:19:00
-- Design Name: 
-- Module Name: LS - Behavioral
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

entity LS is
    Port ( D : in unsigned(18 downto 0);
           CLK : in STD_LOGIC;
           R: in STD_LOGIC;
           Q : out unsigned(18 downto 0) := (others => '0'));
end LS;

architecture Behavioral of LS is

begin

    process(CLK)
    begin
        if(rising_edge(CLK)) then
                if R = '1' then
                Q <= (others => '0');
                else
                Q <= D;
                end if;
        end if;
    end process;
    
end Behavioral;
