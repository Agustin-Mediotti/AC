; Escriba una subrutina que reciba como parámetros las direcciones del comienzo de dos cadenas 
; terminadas en cero y retorne la posición en la que las dos cadenas difieren. 
; En caso de que las dos cadenas sean idénticas, debe retornar -1.


.data

    str1: .asciiz "hola"
    str2: .asciiz "hora"
    num: .word 0

.code

    daddi $a0, $0, str1     ; Movemos la direccion de las cadenas
    daddi $a1, $0, str2     ; $a0-$a3 Argumentos pasados a la subrutina llamada

    jal comparar
    sd $v0, num($zero)
    halt

    comparar: dadd $v0, $0, $0
        loop: lbu $t0, 0($a0)
            lbu $t1, 0($a1)
            beqz $t0, fin_a0
            beqz $t1, final
            bne $t0, $t1, final
            daddi $v0, $v0, 1
            daddi $a0, $a0, 1
            daddi $a1, $a1, 1
            j loop

        fin_a0: bnez $t1, final
            daddi $v0, $0, -1
        final: jr $ra