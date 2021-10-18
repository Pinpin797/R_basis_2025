#! /bin/bash

# Convert list of mail to the format : NOM;Prenom 
# for the page https://instella.ens-lyon.fr/stella/intra/compteInvite.html -> Ajouter une liste de comptes

cat *.csv | grep -v "@ens-lyon.fr" | sed -e 's/\(.*\)\.\(.*\)@.*/\2 \1/g' | awk 'BEGIN { OFS="" }{print toupper($1),";",  $2}'
