# IFB cloud group description for R training

## Short name

CAN R 2024

## Full name

R for beginners training

## Website

https://gitbio.ens-lyon.fr/can/R_basis

---

# Detailed description

## Résumé (20 lignes)

Le [Conseil d'Analyse Numérique (CAN)](https://www.sfr-biosciences.fr/la-sfr/conseil-analyse-numerique/) de l'UAR [SFR BioSciences](https://www.sfr-biosciences.fr) (Lyon) organise une formation **"R pour les débutants"** à destination des membres des laboratoires de biologie affiliés (entre autres ceux hébergés à l'ENS de Lyon), laquelle débutera début octobre.

Cette formation s'étalera sur une quatorzaine de semaines à raison de 1h30 par semaine au semestre d'automne (suivant les demandes, elle aura lieu tous les ans au semestre d'automne).

Les objectifs de cette formation sont:

- apprendre les bases du langages R
- apprendre à utiliser l’IDE Rstudio
- importer des tables de données
- filtrer et trier des tables de données
- réorganiser des tables de données
- réaliser des figures
- manipuler des expressions régulières

## Informations pratiques

- Dates : 4 séances de 1h30 par semaine de octobre 2024 à janvier 2025
- Lieu : Centre Blaise Pascal (CBP), ENS de Lyon
- Noms des formateurs : Laurent Modolo, Ghislain Durif, Carine Rey, Laurent Gilquin, Mia Croiset, Nicolas Fontrodona
- Nombre de participants : 4 groupes * 12

## Ressources demandées

Nous utiliserons des instances de l'*appliance* "Rstudio server" déjà utilisée l'année dernière. Les TPs portent sur la prise en main de R et Rstudio, nous aurons besoin d'une VM de 4 vCPU au plus par séance (les stagiaires travailleront sur la même VM via des comptes ad hoc).

### Outils et environnements

- R
- RStudio
- `tidyverse` R meta-package

Tous ces outils sont intégrés dans l'*appliance* "RStudio Server".

### Resources informatiques

* Taille max des VMs par participant : 4 vCPU, 4Go mémoire RAM, gabarit `ifb.tr.large` (4c 4Go)
* Nombre total d'heures vCPU (vCPU.h) : 4 vCPU * 4 séances/semaine * 14 semaines * 2h (petite marge pour lancer et éteindre les VMs avant et après les séances) = 448 vCPU.h
* Volume de stockage partagé : <1Go
* Besoins spécifiques
  - grosse mémoire (RAM > 1 To) : NON
  - GPU : NON
  - haute fréquence processeur (> 3 GHz) : NON
  - parallélisme : 2 vCPU/VM max

Disponibilité des ressources après la formation ? NON

---

## Start

30/09/2024

## End

31/01/2025
