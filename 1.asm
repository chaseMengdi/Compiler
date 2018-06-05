ASSUME CS:codesg,DS:datasg
datasg segment
    x DB '?'
    y DB '?'
    z DB '?'
    tmpB DB '?'
    tmpC DB '?'
    tmpD DB '?'
    tmpE DB '?'
    tmpF DB 'The result of is $'
datasg ends
codesg segment
  start:
    mov AX,datasg
    mov DS,AX
    mov BL,2
    mov x,BL
    mov BL,5
    mov y,BL
    mov BL,6
    mov z,BL
    mov AL,x
    mov BH,y
    mul BH
    mov BL,1
    div BL
    mov tmpB,AL
    mov BL,tmpB
    mov y,BL
    mov BL,z
    add BL,y
    mov tmpC,BL
    mov BL,tmpC
    mov z,BL
    mov BL,z
    sub BL,2
    mov tmpD,BL
    mov BL,tmpD
    mov z,BL
    mov AL,z
    CBW
    mov BL,2
    div BL
    mov tmpE,AL
    mov BL,tmpE
    mov z,BL
    LEA DX,tmpF
    mov AH,09
    int 21H
    mov AL,z
    CBW
    mov BL,10
    DIV BL
    mov BH,AH
    add BH,30H
    add AL,30H
    CMP AL,48
    JE stepC
  stepB:
    mov DL,AL
    mov AH,2
    int 21H
  stepC:
    mov DL,BH
    mov AH,2
    int 21H
    mov ax,4C00H
    int 21H
codesg ends
  end start
