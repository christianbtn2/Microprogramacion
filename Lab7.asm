.386
.model flat, stdcall
option casemap:none
; Includes
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
include \masm32\include\masm32rt.inc 
; librerias
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib
; Segmento de Datos
.DATA  

value1 dword 3
value2 dword 2
suma dword 0
resta dword 0
salidaSuma DB 0aH,0DH,"El total de la suma da: " ,0
salidaResta DB 0aH,0DH,"El total de la resta da: " ,0

PrimeroMayor DB 0aH,0DH,"El primer numero es mayor" ,0
SegundoMayor DB 0aH,0DH,"El segundo numero es mayor" ,0
SonIfEquales DB 0aH,0DH,"Los numeros son IfEquales" ,0

.CODE 
 
programa:
main PROC
	
	mov eax,value1
	ADD eax,value2
	mov suma,eax
	ADD suma,30h

	mov eax,value1
	SUB eax,value2
	mov resta,eax
	ADD resta,30h

	INVOKE StdOut, addr salidaSuma
	INVOKE StdOut, addr suma

	INVOKE StdOut, addr salidaResta
	INVOKE StdOut, addr resta

	mov eax,value1
	cmp eax,value2
	jz IfEqual
	jc IfSegundo
	jnz IfPimero
	
	IfPimero:
	INVOKE StdOut, addr PrimeroMayor
	jmp finished

	IfSegundo:
	INVOKE StdOut, addr SegundoMayor
	jmp finished

	IfEqual:
	INVOKE StdOut, addr SonIfEquales
	jmp finished



	finished:
	INVOKE ExitProcess,0
	main ENDP
END programa
