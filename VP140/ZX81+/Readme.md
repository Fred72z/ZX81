# ZX81+38

Modif du ZX81+38

Dans un premier temps, le circuit est assemblé sans les jack d'accès à la K7 mais avec la sortie RCA (vidéo) et l'entrée USB (alimentation).

Pour ajouter de la mémoire, la 62256 (32K) est remmplacée par une NVRAM DS1245 (128K)

Le brochage du circuit est compatible avec l'ancienne RAM mais possède 4 broches supplémentaires. Les broches 31 et 32 doivent être reliées à Vcc tandis que la broche 2 est A16.

à cause de la gestion du DFILE, cette broche ne peut pas être raccordée directement à A15 et doit passer par un OU avec M1.
Sur le ZX81+38, ce signal est disponible sur la broche 3 de U24 (74LS08).

Il faut donc ajouter un fil sur la broche 2 puis placer le composant sur le support en laissant dépasser les 4 broches côté encoche puis en passant le fil dans le trou à proximité.


![ZX81+38_Front](./ZX81_Font.jpg?raw=true "Optional Title")

Il ne reste plus qu'à retourner le circuit imprimé et à souder le fil sur la broche 3 de U24. le fil sera maintenu en place avec quelques petits points de colle.

![ZX81+38_Front](./ZX81_Font.jpg?raw=true "Optional Title")

Il faut ensuite modifier le cavalier JP12 pour le mettre sur 32K. Cela permet de connecter la ligne A14 à la RAM.
Le cavalier se trouve sous le pcb. La connexion 16K est établie par une piste qu'il faut donc couper au cutter avant de mettre un petit morceau de fil pour relier les 2 autres broches.

![modif_ZX81](./modif_ZX81.jpg?raw=true "Optional Title")


La ROM ZX81_48K a été modifiée afin de commencer le test mémoire plus haut, il n'est donc pas nécessaire de modifier RAMTOP.


Il reste maintenant à vérifier que le ZX81 démarre normalement.











