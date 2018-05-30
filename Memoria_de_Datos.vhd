--Grupo: 
			--Chavez, Mauro.
			--Santamaria, Araceli.
			--Sánchez, Lourdes.
--
 library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
 use std.textio.all;
 

 -- DEBE TENER EN CUENTA QUE LA MAXIMA CANTIDAD DE BITS QUE PUEDEN DIRECCIONAR 'ADDR_i' ES 10 ('size'), QUE SERIAS LOS 10 BITS
                                       -- MENOS SIGNIFICATIVO DE LOS 64 BITS DE ENTRADA. 
 entity Memoria_de_Datos is
     generic (size : integer :=10);
	  
     port (
         CLK_i: in std_logic;
         ADDR_i: in std_logic_vector(63 downto 0);
         DATA_i: in std_logic_vector (63 downto 0);
         DATA_o: out std_logic_vector (63 downto 0);
         MemWrite: in std_logic;
			MemRead: in std_logic);
			
			
 end entity Memoria_de_Datos;
 
 architecture MyHDL of Memoria_de_Datos is
 
 type t_array_mem is array(0 to 2**size-1) of std_logic_vector (63 downto 0);  -- se crea una matriz de 2^10 registro y 64 bits de palabra
 signal mem: t_array_mem;                                           -- cada registro.
 signal ADDR:  	std_logic_vector(size-1 downto 0);
 
 begin
 
 
 DATA_MEMORY_LOGIC: process (CLK_i) is
 begin
 
		for i in size-1 downto 0 loop -- de esta forma limitamos la cantidad de bits de direccionamiento..
        ADDR(i) <= ADDR_i(i);
	  
		end loop;
	
	--  ADDR <= ADDR_i;
	  
     if (CLK_i'event and CLK_i='1' ) then
	  
         if (MemRead = '1') then     -- se le da mas prioridad a la lectura de la memoria que la escritura, en caso de que ambas
			                          -- estren activas al mismo tiempo, esto se hace para que no se modifique algun valor en la memoria
             DATA_o <= mem(to_integer(signed(ADDR)));  -- por accidente.
				 
         elsif (MemWrite = '1') then    
			
             mem(to_integer(signed(ADDR))) <= DATA_i;
				 
         end if;
			
     end if;
	  
 end process DATA_MEMORY_LOGIC;
 
 end architecture MyHDL;
