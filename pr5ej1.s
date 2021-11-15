
    ; 16 ciclos
    ; 7 instrucciones
    ; 2.286 CPI

    ; 2 atasco estructural
        ; Atasco estructural en EX(M4) [ s.d f3, res1(r0) ]
        ; Atasco estructural en EX     [ s.d f4, res2(r0) ]

    ; 4 atascos por dependencia de datos
        ; Atasco RAW en ADD (F2) [ add.d f3, f2, f1 ] Entra mul.d y add.d al EX
        ; Atasco RAW en EX (F3)  [ s.d f3, res1(r0) ]
        ; Atasco RAW en EX (F3)  [ s.d f3, res1(r0) ]
        ; Atasco RAW en EX (F4)  [ s.d f4, res2(r0) ]


; Los atascos estructurales se generan cuando la instrucción previa está en fase MEM 
; y la siguiente en fase EX. Ocea, todavía no se guardó el resultado de la operación
; antes de poder usarlo.


.data

    n1: .double 9.13
    n2: .double 6.58
    res1: .double 0.0
    res2: .double 0.0

.code

    l.d f1, n1(r0)
    l.d f2, n2(r0)
    add.d f3, f2, f1
    mul.d f4, f2, f1
    s.d f3, res1(r0)
    s.d f4, res2(r0)

    halt