
; a) Implemente la subrutina factorial definida en forma recursiva. Tenga presente que el factorial
; de un número entero n se calcula como el producto de los números enteros entre 1 y n inclusive: 
; factorial(n) = n! = n x (n-1) x (n-2) x … x 3 x 2 x 1

.data

    M1: .asciiz "Ingrese un numero para encontrar el factorial:"
    M: .asciiz "\nEl factorial del numero es: "
    V: .word 10
    R: .word 0

.code

    daddi $sp, $zero, 0x400 ; Inicializa puntero al tope de la pila

    ld $a0, V($zero)
    jal factorial
    sd $v0, R($zero)
    halt

    factorial:  daddi $sp, $sp, -16
                sd $ra, 0($sp)
                sd $s0, 8($sp)
                beqz $a0, fin_rec
                dadd $s0, $0, $a0
                daddi $a0, $a0, -1
                jal factorial
                dmul $v0, $v0, $s0
                j fin
    fin_rec:    daddi $v0, $0, 1
    fin:        ld $s0, 8($sp)
                ld $ra, 0($sp)
                daddi $sp, $sp, 16
                jr $ra


; b) ¿Es posible escribir la subrutina factorial sin utilizar una pila? Justifique.

; Si, toda operación recuresiva puede ser realizada mediante iteración ( a travéz de variables )
