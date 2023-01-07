# Clavier

Le Clavier minitel est très différent du clavier du ZX81. Aussi la disposition des touches est différentes. L'utilisation d'un PIC pour reproduire la matrice du clavier du ZX permet de rediriger certaines combinaisons de touches afin de simplificer l'utilisation du clavier minitel.

![Map clavier](map_clavier_minitel.jpg?raw=true "Optional Title")

Un appui simultané sur les touches Fcnt et Connexion/Fin permet de faire un RESET du ZX (appui prolongé).
Une petite led a été ajoutée au dessus de la touche Répétition pour indiquer l'activation de ce mode (désactivé à la mise sous tension).

#Ajout de la led

La led utilisée est une led 2mm à canon long (visible sur la photo). Il suffit de percer un trou de 2mm (1.9mm puis 2mm pour être juste à la cote).
Elle est recouverte de gaine thermorétractable pour éviter la lumière parasite sur les côtés. La résistances de limitation du courant doit être ajustée en fonction de la led choisie. Ici la résistance vaut 15k (La résistance est maintenant placée sur la platine principale).

![Led clavier](led_clavier.jpg?raw=true "Optional Title")

Pour la révision 1.3, une 2ème led a été ajoutée pour choisir 2 versions de la ROM du ZX.
