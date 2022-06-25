# Clavier

La matrice du clavier du minitel est très différente de celle du ZX81 et par conséquent il n'est pas possible de la connecter directement au ZX.

L'interfaçage se fait via un PIC 16F876A qui va lire le clavier minitel et transmettre les codes équivalent au ZX81 via 8 registres à décalage à sorties 3 états pilotés par les lignes d'adresses A8-A15.
Les registres sont implantés dans le CPLD.

Le programme est écrit en C (CC5X) sous MPLAB.
