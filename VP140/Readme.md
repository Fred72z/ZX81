# VP140

Le VP140 est un terminal de type minitel renfermant une carte mère de ZX81.
C'est une copie un peu améliorée du VP100 construit au début des années 80 par MAGECO.

[Edit 27/12/2022]: Les documents sont désormais en version 1.2. Voir à la fin pour les détails des modifications.

![VP140](./VP140_1.JPG?raw=true "Optional Title")

Il utilise un minitel 1B dont il reprend le clavier, la platine d'alimentation et les circuits vidéos.

Le montage est construit autour d'un clone du ZX81, le projet ZX81+38 qui utilise des circuits logiques standards à la place de l'ULA.

[ZX81+38 ver 1.6](https://revspace.nl/ZX81plus38_simple_to_build_ZX-81_clone)

Le ZX81+38 est monté sur une platine qui reprend les mêmes dimensions que la carte mère du minitel afin de s'intégrer parfaitement dans le boitier.

![Intérieur du VP140](./VP140_2.JPG?raw=true "Optional Title")

![Carte principale](./VP140_3.JPG?raw=true "Optional Title")

Par manque de place, quelques composants sont montés sous le pcb.
![Carte principale](./VP140_4.JPG?raw=true "Optional Title")


Les performances (modestes) de l'engin sont celles d'un ZX81 auquelles il ajoute:

-48K de mémoire RAM

-8Ko mémoire ROM (ZX81)

-256Ko de mémoire ROM placée aux adresses [2000h-3FFFh] soit 32 banques de 8Ko (cartouche).

-Circuit sonore YMZ284 compatible ZonX avec ampli et HP intégré

-UART 9600 bauds RS232

-UART 19200 bauds USB (ver 1.2)

-Joystick type videopac

-Clavier mécanique

-Ecran N/B

## Ver 1.2

Le circuit principal a été un peu modifié :
- La désactivation de la RAM du ZX81+38 ne se fait plus par un transistor pilotant RAMCS mais par la commande directe de RAMCS par le CPLD.
- Le circuit vidéo comporte une inhibition supplémentaire évitant l'apparition d'une bande verticale blanche sur l'écran durant le mode FAST
- La vitesse de l'UART (USB) a été réduite à 19200 bauds
- Les caractères auxiliaires (en orange) du clavier ont été mappés vers le clavier du ZX. Il s'agit de la ligne au dessus des lettres avec les caractères de ponctuations (' , . ' ; - : ?). L'utilisation de ces touches avec la touche Shift enfoncée donne les caractères (< > + = * /). De même pour les parenthèses avec les touches 8 et 9. La touche ESC donne le mode GRAPHIC. Et la répétition des touches s'active ou se désactive par la touche Répétition.


# Périphériques

PSG : YMZ284 (compatible AY3-8910) placé aux adresses classiques de l'extension ZonX (I/O $0F, $1F, $CF et $DF).
- $0F, $1F = DATA
- $CF, $DF = REG

ACIA0 : MC6850 @ 19200 bauds placé en mémoire aux adresses $FFF0-$FFF3
- $FFF0 : Control/Status
- $FFF2 : TDR/RDR

ACIA1 : MC6850 @  9600 bauds placé en mémoire aux adresses $FFF8-$FFFB
- $FFF8 : Control/Status
- $FFFA : TDR/RDR

Sélection ROM : Permet de sélectionner la banque ROM disponible en [$2000-$3FFF]
- $FFFF : bits [4-0]= N° de banque ([0 à 31], bit 5= ROM/RAM [0:ROM, 1:RAM]

à la mise sous tension, C'est la ROM0 qui est sélectionnée.
