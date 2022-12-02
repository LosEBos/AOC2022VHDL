----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.12.2022 19:39:51
-- Design Name: 
-- Module Name: main - Behavioral
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

entity main is
  Port (a : in unsigned(18 downto 0);
        clk: in std_logic;
        b : out unsigned(9 downto 0));
end main;

architecture Behavioral of main is

component LS is
    Port ( D : in unsigned (18 downto 0);
           CLK : in STD_LOGIC;
           R: in STD_LOGIC;
           Q : out unsigned (18 downto 0));
end component;

signal reset: std_logic;
signal LS_out: unsigned(18 downto 0);

signal iter: integer := 0;

signal bigestIter: integer := 0;
signal max: unsigned(18 downto 0) := (others => '0');

signal sum: unsigned(18 downto 0) := (others => '0');

begin
    
    sum <= a + LS_out;
    
    current: LS 
        port map( D => sum,
                  CLK => clk,
                  R => reset,
                  Q => LS_out
    );
    
    --Summation Logic    
    process(clk)
    begin
        if a = "0000000000000000000" then
                if rising_edge(clk) then
                    iter <= iter + 1;
                end if;
                reset <= '1';
            else
                reset <= '0';
        end if;
    end process;
    
    --Compare logic
    process(sum)
    begin
        if LS_out > max then
                max <= LS_out;
                bigestIter <= iter;
        end if;
    end process;
    
    b <= to_unsigned(bigestIter, 10);

end Behavioral;
