# Data_Memory
# Bloque de la memoria de datos

# Materia: Arquitectura de Computadoras
## Autores del bloque:
- Chavez Mauro (@chavezmauro) 
- Sanchez Lourdes (@lourdessanchez)
- Santamaria Araceli (@aracelisantamaria)

Memoria de Datos
Dentro de la carpeta src "Memoria_de_Datos.vhd" describe el comportamiento la memoria de datos, y dentro de la carpeta tb_src se encuentra "tb_mem_dato.vhd", el cual describe el Test Bench utilizado para comprobar el funcionamiento de la memoria de datos.La memoria de datos está descripta de manera genérica, aunque por defecto se definió la posibilidad de direccionar con 10 bits (los 10 menos significativos de los 64 bits de entrada) y una cantidad de 1024 palabras.

# Pines de entrada/salida
Descripción de las funciones de los pines de **entrada/salida**.

| Pines                | I/O      |   Función                                                |
|     :----:           |  :----:  |          :----:                                            |
|ADDR_i [63 : 0]       | IN       | Dirección de escritura/lectura en memoria de datos de la dirección ADDR_i_0   |
|DATA_i [63 : 0]       | IN       | Dato de entrada  que se almacena en memoria de datos |
|DATA_o [63 : 0]       | OUT      | Dato ubicado en la dirección de memoria determinado ADDR    |
|MemWrite              | IN       | Señal de escritura en dirección ADDR de la memoria del dato   |
|MemRead               | IN       | Señal de lectura de la dirección ADDR de la memoria del dato   |
|CLK_i                 | IN       | Reloj de sincronización |

# Datos genéricos
 Descripción de valores genéricos para la descripción del bloque.


# Comportamiento de la memoria de datos
 La memoria de datos....
