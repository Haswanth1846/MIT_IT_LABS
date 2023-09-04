	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=NUM1+12
	LDR R1,=NUM2+12
	LDR R2,=RES+12
	MOV R5,#4
LOOP
	LDR R3,[R0],#-4
	LDR R4,[R1],#-4
	SBC R3,R3,R4
	STR R3,[R2],#-4
	SUBS R5,#1
	BNE LOOP
STOP
	B STOP
NUM2 DCD 1,2,3,4
NUM1 DCD 5,6,7,8
	AREA DATASEG,DATA,READWRITE
RES DCD 0
	END