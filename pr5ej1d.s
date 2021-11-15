
; Atasco WAR en ID (F1) [ mul.d f1, f2, f1 ]

; Sucede porque el mul.d entra en fase ID sin que i.d f2 halla pasado por WB


.data

    n1: .double 9.13
    n2: .double 6.58
    res1: .double 0.0
    res2: .double 0.0

.code

    l.d f1, n1(r0)
    l.d f2, n2(r0)

; Inciso E:
    nop ; esta instrucción le da tiempo a la instrucción anterior para que pase por WB,
        ; entonces solucionamos el atasco tipo RAW de la instruccion ADD

    add.d f3, f2, f1
    mul.d f1, f2, f1
    mul.d f4, f2, f1
    s.d f3, res1(r0)
    s.d f4, res2(r0)

    halt