; Programa de tutorias del Dep de orientación y psicología del Instituto Tecnológico de Costa Rica.
; Sede Interuniversitaria de Alajuela.
; Ejemplo#1 de NASM. Consultar Nombre
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

largoBuffer equ 50 ;indico que el largo del buffer donde voy a salvar el nombre es de 50 bytes
buffer resb largoBuffer ;reservo esos 50 bytes de momoria
;--------------------------------------------------------------------------------------------------------
section .data ;sección de datos inicializados

mensaje: db "¡Hola!, ¿Cuál es tu nombre?",10 
largo: equ $-mensaje ; 

respuesta: db "Mucho gusto "
largoRespuesta: equ $-respuesta
;--------------------------------------------------------------------------------------------------------
section .text ;sección de código del programa

	global _start 

_start:
	nop ;no ejecutamos acción
	mov ecx, mensaje ;paso como parámetro el puntero del mensaje
	mov edx, largo ;indico cuantos bytes vamos a imprimir
	call imprimir ;llamo a la subrutina que me imprime
	mov ecx, buffer ;paso como parámetro el puntero del buffer que utilizaré para guradar el nombre
	mov edx, largoBuffer ;paso la cantidad de bytes que voy a leer
	call preguntar_nombre ;llamo a la subrutina que me indica que lea del teclado
	; !!!!!! OJO !!!!!!
	; en el eax me queda la cantidad de caracteres leidos más el enter, Ejemplo:
	; mi nombre Gustavo consta de 7 caracteres pero si cuento el enter me da como
	; resultado 8 caracteres leidos
	push eax ;salvo temporalmente en la pila la cantidad de caracteres leidos
	; esto con el fin de tener almacenado este numero para futuro uso
	mov ecx, respuesta ;paso como parámetro el puntero del mensaje de respuesta
	mov edx, largoRespuesta ;indico cuantos bytes vamos a imprimir
	call imprimir ;llamo a la subrutina que me imprime
	mov ecx, buffer ;paso como parámetro el puntero del nombre almacenado
	pop edx ;saco de la pila el largo del puntero, incluyendo el cambio de linea
	call imprimir ;llamo a la subrutina que me imprime

cierra: ;etiqueta que indica que vamos a cerrar el programa
	mov eax, sys_exit ;indico que vamos a cerrar el programa
	xor ebx, ebx ;limpio el registro
	int 80h ;ejecutamos lo anterior
;--------------------------------------------------------------------------------------------------------
; 											S U B R U T I N A S 
imprimir:
	mov eax, sys_write ;indico al eax que vamos a imprimir
	mov ebx, stdout ;indico que vamos a imprimir en el standart output
	int 80h ;ejecutamos lo anterior
	ret 

preguntar_nombre:
	mov eax, sys_read ;indico al eax que vamos a leer
	mov ebx, stdin ;indico que vamos a leer desde el standart input
	int 80h ;ejecutamos lo anterior
	ret