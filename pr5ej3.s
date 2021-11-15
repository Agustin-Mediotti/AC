; Escribir un programa que calcule la superficie de un triángulo rectángulo 
; de base 5,85 cm y altura 13,47 cm

.data

    B: .double 5.85
    A: .double 13.47
    S: .double 2.0

.code

    l.d f1, B(r0)
    l.d f2, A(r0)
    l.d f3, S(r0)

    mul.d f4, f1, f2
    div.d f3, f4, f3

    s.d f3, S(r0)

    halt