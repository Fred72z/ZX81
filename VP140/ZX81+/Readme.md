# Modification du ZX81+38

Les modifications décrites ici s'appliquent uniquement à la version 1.6 du ZX81+38. En effet les version 1.7 et supérieures sont différentes au niveau de JP1 et JP3.

La platine du ZX81+38 rev 1.6 doit être modifiée pour ajouter de la mémoire.

Dans un premier temps, le circuit est assemblé sans les jacks K7 mais avec la sortie RCA (vidéo) et l'entrée USB (alimentation).

Pour ajouter de la mémoire, la 62256 (32K) est remplacée par une NVRAM DS1245 (128K). Le brochage du circuit est compatible avec l'ancienne RAM mais possède 4 broches supplémentaires. Les broches 31 et 32 doivent être reliées à Vcc tandis que la broche 2 est A16.

![Modif_DS1245](./modif_DS1245.jpg?raw=true "Optional Title")


à cause de la gestion du DFILE, cette broche ne peut pas être raccordée directement à A15 et doit passer par un OU avec M1.
Sur le ZX81+38, ce signal est disponible sur la broche 3 de U24 (74LS08).

Il faut donc ajouter un fil sur la broche 2 puis placer le composant sur le support en laissant dépasser les 4 broches côté encoche puis en passant le fil dans le trou à proximité.


![ZX81+38_Front](./ZX81_Front.jpg?raw=true "Optional Title")

Il ne reste plus qu'à retourner le circuit imprimé et souder le fil sur la broche 3 de U24. le fil sera maintenu en place avec quelques petits points de colle.

![ZX81+38_Back](./ZX81_back.jpg?raw=true "Optional Title")

Il faut ensuite modifier le cavalier JP12 pour le mettre sur 32K. Cela permet de connecter la ligne A14 à la RAM.
Le cavalier se trouve sous le pcb. La connexion 16K est établie par une piste qu'il faut couper au cutter avant de mettre un petit morceau de fil pour relier les 2 autres broches (liaison en jaune).

![ZX81+_modif](./modif_ZX81.jpg?raw=true "Optional Title")

Le fichier ROM ZX81_48K.bin prévu pour une 27C256 (32K) a été modifié afin de commencer le test mémoire plus haut, il n'est donc pas nécessaire de modifier RAMTOP.
Remarque: RAMTOP est défini à FF00h. Les derniers 128 octets de l'espace adressable (FF80-FFFF) sont réservés aux périphériques.

RAMTOP : PRINT PEEK 16388+256*PEEK 16389 donne 65280


Il reste maintenant à vérifier que le ZX81 démarre normalement.

Le répertoire ROM contient 2 fichiers binaires modifiés pour la version 48K (initalisation de RAMTOP):
- Zx81a : version normale
- Zx81x2 : version améliorée de la ROM (2x plus rapide) par zsolt : [Zx81x2](https://www.sinclairzxworld.com/viewtopic.php?f=5&t=2986).

## Ver 1.2
Avant de mettre la platine en place sur le circuit principal du VP140 il faut enlever la résistance R43 (sélection RAMCS) placée juste au dessus du Z80.

## Ver 1.3
La broche A13 de l'EPROM (27C128) peut être détournée vers le point P11 du circuit principal afin de disposer de 2 versions de la ROM ou 2 langages.
Le choix de la banque mémoire est fait par le clavier avec la touche Retour. Une led indique la partie active de la ROM (allumée => A13=1). Cette valeur est enregistrée dans la mémoire EEPROM du PIC.
Un appui prolongé sur la touche Retour change l'état de A13 puis provoque un reset du ZX.








