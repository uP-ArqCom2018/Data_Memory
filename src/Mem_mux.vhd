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
 entity Mem_mux is
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
						
 end entity Mem_mux;
 
 architecture MyHDL of Mem_mux is
 
  component Memoria_de_Datos is
  
 generic (size: integer );
	  
     port (
         CLK_i: in std_logic;
         ADDR_i: in std_logic_vector(63 downto 0);
         DATA_i: in std_logic_vector (63 downto 0);
         DATA_o: out std_logic_vector (63 downto 0);
         MemWrite: in std_logic;
			MemRead: in std_logic);
			
 end component Memoria_de_Datos;
 
 
 component Multiplexor2 is

    port (
 			MemtoReg: in std_logic;
			Mux2_1_i: in std_logic_vector (63 downto 0);
			Mux2_2_i: in std_logic_vector (63 downto 0);
			W_c_i: out std_logic_vector (63 downto 0));
			
 end component Multiplexor2;

 signal mux_aux:  std_logic_vector (63 downto 0);
 signal aux:  std_logic_vector (63 downto 0);

 begin
 
 Mux: Multiplexor2
 
	 port map(
        MemtoReg=> MemtoReg,
        Mux2_1_i=> mux_aux,
        Mux2_2_i => Mux2_2_i,
        W_c_i => aux );
		  
Mem_datos: Memoria_de_Datos

 generic map (size)
	port map(
         CLK_i=> CLK_i,
         ADDR_i=> ADDR_i,
         DATA_i=> DATA_i,
         DATA_o=> mux_aux,
         MemWrite=>MemWrite, 
			MemRead=> MemRead);

W_c_i <= aux; 

	    
 end architecture MyHDL;