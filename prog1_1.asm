ORG 100h
INCLUDE 'emu8086.inc'

PRINTN "Enter a string:" 

MOV DX, 20

CALL get_string

CALL count

MOV AH,0eh


PRINTN
PRINTN "Reversed string is: "  

MOV DI,0
 
printchar:
  
    MOV BL,[DS+DI]  
    
    CALL convert    
    
    INT 10h 
    INC DI
         
LOOP printchar 

JMP end  

convert PROC
    
    
        CMP BL,41h
        JL not_a_letter
    
        CMP BL,5Ah
        JLE convert_to_lower
    
        CMP BL,61h
        JL Not_a_Letter
    
        CMP BL,7ah
        JLE convert_to_upper
    
    not_a_letter:
        MOV AL,BL
        JMP stop
    
    convert_to_lower:
        ADD BL,20h 
        MOV AL,BL
        JMP stop
    
    convert_to_upper:
        SUB BL,20h
        MOV AL,BL
        
    
    stop:
        RET   
        
convert ENDP  


count PROC
    MOV CX,0
    
    LOOP:
       CMP [DI],0    
       JE quit  
       INC CX 
       INC DI
       JMP LOOP    
    
    quit:
        RET
        
count ENDP

end:
    HLT

define_get_string
end

