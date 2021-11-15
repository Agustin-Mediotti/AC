
; Escriba una subrutina que reciba como parámetros un número positivo M de 64 bits, 
; la dirección del comienzo de una tabla que contenga valores numéricos de 64 bits
; sin signo y la cantidad de valores almacenados en dicha tabla.
; La subrutina debe retornar la cantidad de valores mayores que M contenidos en la tabla.

.data

    M: .word 2
    T: .word 0,1,2,3,4,5,6,7,8,9
    C: .word 10

    R: .word 0

.code

    daddu $a0, $0, $0
    ld $t0, C($0)
    ld $t2, M($0)
    ld $t3, R($0)

    daddi $a1, $0, T

    j loop
    halt
    
    loop: ld $t1, T($a0)
        daddi $t2, $t2, 1
        slt $t4, $t1, $t2
        bnez $t4, pasar
        daddi $t3, $t3, 1
        dsubu $a1, $a1, 1
        pasar: beqz $a1, fin
        daddi $a0, $a0, 1
        j loop
