# Modification du ZX81+38

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
Le cavalier se trouve sous le pcb. La connexion 16K est établie par une piste qu'il faut couper au cutter (attention, il y a une petite piste reliée du plan de masse directement sur le point central qu'il faut couper également) avant de mettre un petit morceau de fil pour relier les 2 autres broches (liaison en jaune).

![modif_ZX81](./modif_ZX81.jpg?raw=true "Optional Title")


Le fichier ROM ZX81_48K.bin prévu pour une 27C256 (32K) a été modifié afin de commencer le test mémoire plus haut, il n'est donc pas nécessaire de modifier RAMTOP.
Remarque: RAMTOP est défini à FF00h. Les derniers 128 octets de l'espace adressable (FF80-FFFF) sont réservés aux périphériques.

RAMTOP : PRINT PEEK 16388+256*PEEK 16389 donne 65280


Il reste maintenant à vérifier que le ZX81 démarre normalement.











