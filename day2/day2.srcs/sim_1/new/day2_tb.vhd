----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2022 13:18:43
-- Design Name: 
-- Module Name: day2_tb - Behavioral
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
    
    signal input1: unsigned(1 downto 0);
    signal input2: unsigned(1 downto 0);
    signal output: unsigned(18 downto 0) := (others => '0');
    signal output2: unsigned(18 downto 0) := (others => '0');
    
    signal clock_tb: std_logic;
    
    file file_VECTORS : text;
    
    component day2 is
    Port ( inA : in unsigned(1 downto 0);
           inB : in unsigned(1 downto 0);
           CLK : in STD_LOGIC;
           output : out unsigned(18 downto 0);
           output2 : out unsigned(18 downto 0));
    end component;
    
    begin
 
 -----------------------------------------------------------------------------------------
 -- Read input logic
-------------------------------------------------------------------------------------------
process
    variable v_ILINE     : line;
    variable v_OLINE     : line;
    variable v_TERM1     : character;
    variable v_SPACE     : character;
    variable v_TERM2     : character;
     
  begin
    file_open(file_VECTORS, "E:\Users\Eric\Documents\Vivado\AOC2022\day2\input.txt",  read_mode);
    
    while not endfile(file_VECTORS) loop
        readline(file_VECTORS, v_ILINE);
        read(v_ILINE, v_TERM1);
        read(v_ILINE, v_SPACE);
        read(v_ILINE, v_TERM2);
        
        input1 <= TO_UNSIGNED(character'pos(v_TERM1)-65, 2);
        input2 <= TO_UNSIGNED(character'pos(v_TERM2)-88, 2);
        wait for 6 ns;
        
    end loop;
    
    file_close(file_VECTORS);
    
    assert(false) report "end of sim" severity failure;
    
end process;
----------------------------------------------------------------------------------
    comp: day2 port map( inA => input1, inB => input2, output => output, output2 => output2, CLK => clock_tb);
    
    process
    begin
       clock_tb <= '0';
       wait for  3ns;
       clock_tb <= '1';
       wait for  3ns;
    end process;

    
end Behavioral;

