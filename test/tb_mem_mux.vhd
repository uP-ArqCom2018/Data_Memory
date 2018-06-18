-- tb_mem_mux


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY tb_mem_mux IS
END tb_mem_mux;

ARCHITECTURE testbench OF tb_mem_mux IS


COMPONENT Mem_mux

    generic (size : integer :=10);
	  
     port (
         CLK_i: in std_logic;
         ADDR_i: in std_logic_vector(63 downto 0);
         DATA_i: in std_logic_vector (63 downto 0);
         MemWrite: in std_logic;
			MemRead: in std_logic;
			MemtoReg: in std_logic;
			Mux2_2_i: in std_logic_vector (63 downto 0);
			W_c_i: out std_logic_vector (63 downto 0));
						
END COMPONENT;

      constant size: integer:=10;
		
      signal CLK_i:  	std_logic;
      signal ADDR_i:  	std_logic_vector(63 downto 0);
      signal DATA_i:  	std_logic_vector (63 downto 0);
      signal MemWrite:  std_logic;
    	signal MemRead:  	std_logic;
		signal MemtoReg:  std_logic;
		signal Mux2_2_i:  std_logic_vector (63 downto 0);
		signal W_c_i:  std_logic_vector (63 downto 0);

BEGIN


 uut:Mem_mux 
		 generic map(size)
		 PORT MAP(  
						CLK_i		=> CLK_i	 ,
						ADDR_i	=> ADDR_i ,
						DATA_i	=> DATA_i ,
						MemWrite	=>	MemWrite,
						MemRead	=>	MemRead,
						MemtoReg	=>	MemtoReg,
                  Mux2_2_i	=>	Mux2_2_i,
						W_c_i	=>	W_c_i);
						
-- Stimulus process

stim_proc: process

begin
MemtoReg <= '1';  -- En la salida del multiplexor se obtiene la salida de la memoria.
Mux2_2_i <= "0000000000000000000000000000000000000000000000000000000000000000";


CLK_i <= '0';  -- ciclo de escritura
wait for 10 ns;

ADDR_i <= "0000000000000000000000000000000000000000000000000000000000011111";
DATA_i <= "0000000000000000000000000000000000000000000000000000000000011111";
MemWrite <= '1';
MemRead <= '0';

wait for 10 ns;

CLK_i <= '1';

wait for 10 ns;
CLK_i <= '0';
wait for 10 ns;

ADDR_i <= "0000000000000000000000000000000000000000000000000000000011011111";
DATA_i <= "0000000000000000000000000000000000000000000000000000000011011111";

MemWrite <= '1';
MemRead <= '0';

wait for 10 ns;
CLK_i <= '1';
wait for 10 ns;
CLK_i <= '0';
wait for 10 ns;
ADDR_i <= "0000000000000000000000000000000000000000000000000000000000000000";
DATA_i <= "0000000000000000000000000000000000000000000000000000000000000000";

MemWrite <= '1';
MemRead <= '0';

wait for 10 ns;
CLK_i <= '0';


wait for 10 ns;
ADDR_i <= "0000000000000000000000000000000000000000000000000000001111111111";
DATA_i <= "0000000000000000000000000000000000000000000000000000001111111111";
CLK_i <= '1';

wait for 10 ns;   -- ciclo de lectura
MemWrite <= '0';

ADDR_i <= "0000000000000000000000000000000000000000000000000000000000011111";

MemRead <= '1';

wait for 10 ns;

ADDR_i <= "0000000000000000000000000000000000000000000000000000000000011111";

MemRead <= '1';

wait for 10 ns;


ADDR_i <= "0000000000000000000000000000000000000000000000000000000011011111";

wait for 3 ns;

MemRead <= '0';

wait for 10 ns;

MemRead <= '1';

wait for 3 ns;

ADDR_i <= "0000000000000000000000000000000000000000000000000000000000000000";
MemRead <= '0';
CLK_i <= '0';

wait for 10 ns;

DATA_i <= "0000000000000000000000000000000000000000000000000000001111111111";

MemRead <= '1';

CLK_i <= '1';

MemtoReg <= '0';  -- En la salida del multiplexor se obtiene la salida de la ALU.

MemRead <= '0';

wait for 10 ns;


ADDR_i <= "0000000000000000000000000000000000000000000000000000000011011111";

wait for 3 ns;

MemRead <= '1';

wait for 10 ns;

MemRead <= '1';

wait for 3 ns;

ADDR_i <= "0000000000000000000000000000000000000000000000000000000000000000";
MemRead <= '0';
CLK_i <= '0';

wait for 10 ns;

DATA_i <= "0000000000000000000000000000000000000000000000000000001111111111";

MemRead <= '1';

CLK_i <= '1';





--		for i in 0 to (2**size) -1 loop
--			for j in 0 to (2**size) -1 loop
--				A <= std_logic_vector(to_unsigned(i,size));
--				B <= std_logic_vector(to_unsigned(j,size));
--				wait for 20 ns;
--			end loop; 
--		end loop;

	wait;
	end process;
END;
