# Data Memory & Multiplexor
# Bloque de la memoria de datos

# Materia: Arquitectura de Computadoras
## Autores del bloque:
- Chavez Mauro (@chavezmauro) 
- Sanchez Lourdes (@lourdessanchez)
- Santamaria Araceli (@aracelisantamaria)

# Memoria de Datos
Dentro de la carpeta src "Memoria_de_Datos.vhd" describe el comportamiento de la memoria de datos, y dentro de la carpeta tb_src se encuentra "tb_mem_dato.vhd", el cual describe el Test Bench utilizado para comprobar el funcionamiento de la memoria de datos (para algunos valores). La memoria de datos está descripta de manera genérica, aunque por defecto se definió la posibilidad de direccionar con 10 bits (los 10 menos significativos de los 64 bits de entrada) y asi crear una cantidad de 1024 palabras.

La memoria de datos se implemento a partir de dos componentes, uno correspondiente a la Memoria de Datos en sí y el restante al Multiplexor que multiplexa entre la salida de la ALU y la de la memoria de datos. En la Figura siguiente se muestra el diagrama de las conexiones entre estos componentes, respresentando las entradas y salidas correspondientes. 

![Memoria de datos & Mux](https://github.com/uP-ArqCom2018/Data_Memory/blob/master/images/DataMemory_Mux.PNG)


# Pines de entrada/salida del componente de la Memoria de Datos.
Descripción de las funciones de los pines de **entrada/salida** del componente de la Memoria de Datos.

| Pines                | I/O      |   Función                                                |
|     :----:           |  :----:  |          :----:                                            |
|ADDR_i [63 : 0]       | IN       | Dirección de escritura/lectura en memoria de datos de la dirección ADDR_i_0   |
|DATA_i [63 : 0]       | IN       | Dato de entrada  que se almacena en memoria de datos |
|DATA_o [63 : 0]       | OUT      | Dato ubicado en la dirección de memoria determinado ADDR    |
|MemWrite              | IN       | Señal de escritura en dirección ADDR de la memoria del dato. Habilitado=1, Deshabilitado=0   |
|MemRead               | IN       | Señal de lectura de la dirección ADDR de la memoria del dato Habilitado=1, Deshabilitado=0   |
|CLK_i                 | IN       | Reloj de sincronización ||CLK_i                 | IN       | Reloj de sincronización |

# Pines de entrada/salida componente del Multiplexor.
Descripción de las funciones de los pines de **entrada/salida** del componente del Multiplexor.

| Pines                | I/O      |   Función                                                |
|     :----:           |  :----:  |          :----:                                            |
|W_c_i                 | OUT      | Salida del multiplexor 2 que luego se dirige al banco de registros |
|MemtoReg              | IN       | Bit de control que selecciona el dato de salida correspondiente a la instrucción |
|MUX2_1_i              | IN       | Dato que se multiplexa dependiendo del valor del bit de control |
|MUX2_2_i              | IN       | Dato que se multiplexa dependiendo del valor del bit de control |


## Descripcion del funcionamiento del multiplexor 
Descripción de las funciones de los pines de **entrada/salida** del multiplexor.

| Pines                |    Función                                                |
|     :----:           |         :----:                                            |
|MemtoReg=1            | A la salida del multiplexor se tiene la salida de la memoria de datos(Mux2_1_i) |
|MemtoReg=0            | A la salida del multiplexor se tiene la salida de la ALU(Mux2_2_i) |

# Comportamiento de la memoria de datos.
La Memoria de Datos es un elemento de estado con entradas para la dirección, los datos de escritura y  una única salida para el resultado de lectura.  Hay controles de lectura y escritura separados, aunque solo la escritura se puede afirmar en un flanco ascendente del reloj. La lectura de la memoria de datos se realiza siempre de forma concurrente. 

**Importante:** Hay que tener en cuenta que cuando no se quiere realizar ninguna acción sobre la memoria de datos, los controles, tanto el de escritura como el de lectura deben ir en cero. 

