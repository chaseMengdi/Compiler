ASSUME CS:codesg,DS:datasg
datasg segment
    b DB '?'
    tmpB DB '2 is smaller than 1$'
datasg ends
codesg segment
  start:
    mov AX,datasg
    mov DS,AX
    mov BL,2
    mov b,BL
    mov AL,b
    CMP AL,1
    JL stepB
    JMP stepC
  stepB:
    JMP stepC
  stepC:
    LEA DX,tmpB
    mov AH,09
    int 21H
    mov ax,4C00H
    int 21H
codesg ends
  end start
