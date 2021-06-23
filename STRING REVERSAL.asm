ASSUME CS:CODE,DS:DATA
DATA SEGMENT
STRING1   DB   5   DUP(' '),'$'
STRING2   DB   5   DUP(' '),'$'
NL        DB 0DH,0AH,'$'
DATA ENDS
CODE SEGMENT
START:
MOV AX,DATA
MOV DS,AX
LEA SI,STRING1
LEA DI,STRING2
MOV AH,01H
INPUT:
INT 21H
CMP AL,0DH
JE L1
MOV [SI],AL
INC SI
JMP INPUT
L1:
MOV AL,'$'
MOV [SI],AL
MOV AH,09H
LEA DX,NL
INT 21H
MOV CX,LENGTH STRING1
ADD CX,1
L2:
DEC SI
MOV AL,[SI]
MOV [DI],AL
INC DI
LOOP L2
MOV AL,'$'
MOV [DI],AL
MOV AH,09H
LEA DX,NL
INT 21H
LEA DX,STRING2
INT 21H
MOV AH,4CH
INT 21H
HLT
CODE ENDS
END START
