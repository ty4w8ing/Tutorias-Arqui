; Programa de tutorias del Dep de orientación y psicología del Instituto Tecnológico de Costa Rica.
; Sede Interuniversitaria de Alajuela.
; Ejemplo#1 de NASM. Hola Mundo
; Hecho por Gustavo González.
;--------------------------------------------------------------------------------------------------------
;A continuación estan unas etiquetas con sus respectivas llamadas al sistema
sys_exit 	equ 1 ;salir del programa
sys_read 	equ 3 ;leer y almacenar
sys_write 	equ 4 ;escribir lo almacenado
sys_open 	equ 5 ;abrir un archivo
sys_close 	equ 6 ;cerrar un archivo
sys_create 	equ 8 ;crear un archivo
stdin 		equ 0 ;standart input
stdout 		equ 1 ;standart output
;--------------------------------------------------------------------------------------------------------
section .bss ;sección de datos no inicializados
;--------------------------------------------------------------------------------------------------------
section .data ;sección de datos inicializados

mensaje: db "Hola Mundo!",10 ;mensaje en bytes conteniendo Hola Mundo! junto a un cambio de linea (10)
largo: equ $-mensaje ;establecemos el largo del mensaje como la cantidad de bytes desde este momento en 
				     ;memoria menos el puntero a mensaje
;--------------------------------------------------------------------------------------------------------
section .text ;sección de código del programa

	global _start 

_start:
	nop ;no ejecutamos acción
imprime: ;etiqueta que indica que vamos a imprimir
	mov eax, sys_write ;indico al eax que vamos a imprimir
	mov ebx, stdout ;indico que vamos a imprimir en el standart output
	mov ecx, mensaje ;paso como parámetro el puntero del mensaje
	mov edx, largo ;indico cuantos bytes vamos a imprimir
	int 80h ;ejecutamos lo anterior
cierra: ;etiqueta que indica que vamos a cerrar el programa
	mov eax, sys_exit ;indico que vamos a cerrar el programa
	xor ebx, ebx ;limpio el registro
	int 80h ;ejecutamos lo anterior