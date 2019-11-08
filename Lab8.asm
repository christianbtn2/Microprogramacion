.386
.MODEL FLAT, STDCALL 
OPTION CASEMAP:NONE

INCLUDE \masm32\include\windows.inc 
INCLUDE \masm32\include\kernel32.inc
INCLUDE \masm32\include\masm32.inc
INCLUDE \masm32\include\masm32rt.inc 


INCLUDELIB \masm32\lib\kernel32.lib
INCLUDELIB \masm32\lib\masm32.lib


Facto MACRO num,resultado
	PUSHA
	
	;Limpiar Registros
	XOR EAX , EAX
	XOR ECX , ECX

	MOV EAX , 1
	MOV CL , num
	multip:	
		MUL ECX
	LOOP multip
	MOV resultado , EAX
	POPA
ENDM

.DATA
	msgIngreso DB 0ah,0dh,"Ingrese un número de 3 cifras ejemplo: 001,002.  ",10,13,0
	comodinD DB 10

	Ingresado DB 3 dup(?)
	numero DB ?
	resultado DD ?
.CODE
program:
main PROC
	
	INVOKE StdOut, ADDR msgIngreso 
	INVOKE StdIn, ADDR Ingresado, 10 

	MOV numero , 0

	MOV AL , Ingresado[2]
	SUB AL , 30h
	ADD numero , AL

	MOV AL , Ingresado[1]
	SUB AL , 30h
	MUL comodinD
	ADD numero , AL

	MOV AL , Ingresado[0]
	SUB AL , 30h
	MUL comodinD
	MUL comodinD
	ADD numero , AL

	Facto numero,resultado
	print str$(resultado),10,13

	INVOKE ExitProcess,0
main ENDP
END program
