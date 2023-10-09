# Formation R

## Important

- Faire l'appel à chaque séance.
- On a une douzaine de séance pour couvrir les 8 chapitres, pas de précipitation.

## Liens utiles

- Calendrier partagé indiquant les horaires et salles (au format iCal) à importer dans votre application agenda préférée : https://webmail-preprod.ens-lyon.fr//public/feed/?_cal=Z2R1cmlmOjUzOWQ2OGE4NGVjOTVlOGVkNmJlZmE1NzljZWY5YzM2.ics&_key=NTM5ZDY4YTg0ZWM5NWU4ZWQ2YmVmYTU3OWNlZjljMzZfY2FsaGFzaGtleV82NGY2ZTdmNDA1OTJj

⚠ Les horaires du lundi et la salle du jeudi peuvent être amené à changer.

## Supports

Les supports de formation sont disponibles ici : https://can.gitbiopages.ens-lyon.fr/R_basis/ (sources : https://gitbio.ens-lyon.fr/can/R_basis)

## Ressources

Nous utiliserons les ressources du [Cloud IFB](https://biosphere.france-bioinformatique.fr/):

- il est accessible via vos identifiants institutionnels (e.g. `@ens-lyon.fr`, etc.)
- ⚠ il faut se connecter une première fois pour demander l'activation de votre compte


### Avant la formation

Rejoindre le groupe "CAN R 2023" sur le cloud IFB : cliquer en haut à droite sur l'icone "profil" → "Groupes" → "Rejoindre un groupe"

### Avant chaque séance^[prendre un peu de marge pour le temps de démarrage de la VM]

1. Lancer une VM "Rstudio server" en utilisant le modèle `ifb.tr.large` (4 vCPU et 4Go RAM) et les quotas du groupe "CAN R 2023".

Onglet "RAINBio" → "App Store" → "Rstudio Server" → cliquer sur la clé "Configure":
  + donner un nom
  + choisir le groupe "CAN R 2023"
  + choisir un cloud, par exemple local comme `meso-psmn-cirrus` ou `ifb-prabi-girofle`
  + choisir le modèle `ifb.tr.large` (4 vCPU et 4Go RAM)

2. Accéder à la VM via l'onglet "myVM":
  + Lien *"https"*: ouvre une session Rstudio dans le navigateur (**il faut accepter l'exception de sécurité**)
  + Lien *"params"*: pour récupérer le *login* et *mot de passe*

3. Récupérer le fichier `r_user_list_<day_number>_<day>.csv` correspondant à votre session via le lien qui vous a été fourni sur le serveur nextcloud de l'ENS.

4. Uploader le fichier `r_user_list_<day_number>_<day>.csv` sur la VM (via l'interface graphique de Rstudio, bouton "upload" dans le panel "Files" en bas à droite)

5. Télécharger le script de création de comptes sur la VM:

```bash
wget https://gitbio.ens-lyon.fr/can/R_basis/-/raw/main/src/create_users_from_user_list_csv.sh
```

4. Créer des comptes ad hoc pour les stagiaires sur la VM:
```bash
sudo bash create_users_from_user_list_csv.sh r_user_list_<day_number>_<day>.csv
```

### Pendant la séance

Partager l'adresse IP de votre serveur Rstudio aux stagiaires qui pourront se connecter en utilisant leurs identifiants.

### Après chaque séance^[ne surtout pas oublier pour libérer des ressources et économiser notre quota]

**Éteindre la VM** depuis l'onglet "myVM".
