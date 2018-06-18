-- Multiplexor 2
--Grupo: 
			--Chavez, Mauro.
			--Santamaria, Araceli.
			--Sánchez, Lourdes.
--
 library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
 use std.textio.all;
 

 -- DEBE TENER EN CUENTA QUE LA MAXIMA CANTIDAD DE BITS QUE PUEDEN DIRECCIONAS 'ADDR_i' ES 10 ('size'), QUE SERIAS LOS 10 BITS
                                       -- MENOS SIGNIFICATIVO DE LOS 64 BITS DE ENTRADA. 
 entity Multiplexor2 is
    
     port (
     		MemtoReg: in std_logic;
			Mux2_1_i: in std_logic_vector (63 downto 0);
			Mux2_2_i: in std_logic_vector (63 downto 0);
			W_c_i: out std_logic_vector (63 downto 0));
			
			
 end entity Multiplexor2;
 
 architecture MyHDL of Multiplexor2 is
 begin
 
 with MemtoReg select        -- Multiplexor numero 2.

			W_c_i<= 	Mux2_1_i when '1', -- la salida de la memoria se conecta directamente a la entrada 1 del multiplexor.
						Mux2_2_i when '0',
						Mux2_1_i when others ;	
		
 end architecture MyHDL;
 

 
 