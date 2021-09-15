#! /usr/bin/bash

# list wifi loing from pdf

pdfgrep "Votre nom de connexion ou login" *.pdf | sed -E 's/.*:.*(z.*)/\1/g'
