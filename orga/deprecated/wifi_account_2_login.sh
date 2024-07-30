#! /usr/bin/bash

# list wifi loing from pdf
echo "login"
pdfgrep "Votre nom de connexion ou login" *.pdf | sed -E 's/.*:.*(z.*)/\1/g'
echo
echo "mot de passe"
pdfgrep "Votre mot de passe initial" FicheLogin*.pdf | sed -E 's/.*:.*([a-Z0-9]{8})$/\1/g'
