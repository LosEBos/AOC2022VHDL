----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.12.2022 19:40:24
-- Design Name: 
-- Module Name: testbench - Behavioral
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

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is
    
    signal testin: unsigned(18 downto 0);
    signal testout: unsigned(9 downto 0);
    
    signal clock_tb: std_logic;
    
    file file_VECTORS : text;
    
    component main
         Port ( a : in unsigned(18 downto 0);
                clk: in std_logic;
                b : out unsigned(9 downto 0));
    end component;
begin
-------------------------------------------------------------------------------------------

process
    variable v_ILINE     : line;
    variable v_OLINE     : line;
    variable v_ADD_TERM1 : integer;
    variable v_SPACE     : character;
     
  begin
    file_open(file_VECTORS, "E:\Users\Eric\Documents\Vivado\AOC2022\1\input.txt",  read_mode);
    
    while not endfile(file_VECTORS) loop
        readline(file_VECTORS, v_ILINE);
        read(v_ILINE, v_ADD_TERM1);
        
        testin <= TO_UNSIGNED(v_ADD_TERM1, 19);
        wait for 6 ns;
        
    end loop;
    
    file_close(file_VECTORS);
    
    assert(false) report "end of sim" severity failure;
    
end process;
----------------------------------------------------------------------------------

    comp: main port map( a => testin, b => testout, clk => clock_tb);
    
    process
    begin
       clock_tb <= '0';
       wait for  3ns;
       clock_tb <= '1';
       wait for  3ns;
    end process;

    
end Behavioral;
