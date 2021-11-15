
.data

    E: .double 1.74
    P: .double 60.0
    IMC: .double 0.0
    STATE: .word 0

    infra: .double 18.5
    normal: .double 25.0
    sobre: .double 30.0

.code

    l.d f1, E($0)
    l.d f2, P($0)
    l.d f3, IMC($0)
    l.d f4, STATE($0)

    l.d f5, infra($0)
    l.d f6, normal($0)
    l.d f7, sobre($0)

    mul.d f1, f1, f1
    div.d f3, f2, f1

    c.lt.d  f3, f5
    bc1t infrapeso

    c.lt.d  f3, f6
    bc1t pesoNormal

    c.lt.d f3, f7
    bc1t sobrepeso


    infrapeso: daddi $t0, $0, 1
        j fin
    
    pesoNormal: daddi $t0, $0, 2
        j fin
    
    sobrepeso: daddi $t0, $0, 3
        j fin
    
    obeso: daddi $t0, $0, 4
        j fin

    fin: sd $t0, STATE($0) 
        halt