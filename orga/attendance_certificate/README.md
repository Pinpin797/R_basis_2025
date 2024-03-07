# Attendance certificate template

1. Fill the [`participants.csv`](./participants.csv) file, repecting the fields/columns and separators:
```
ID,FIRSTNAME,LASTNAME,DAY,SESSION,TIME
1,John,Doe,monday,1,1h30
2,Jane,Doe,monday,2,3h
```

> **Note:** you can do it with a spreadsheet software like libreoffice calc.

2. Fill the information in the LaTeX [`certificate.tex`](./certificate.tex) file regarding validator id, training date, summary, etc.

3. Compile `certificate.tex`:
```bash
pdflatex certificate.tex
```

> All certificate attendance are now available in a single file `certificate.pdf`.

4. Run the [`split_pdf.sh`](./split_pdf.sh) bash script to split the `certificate.pdf` into individual certificate file, one for each person in [`participants.csv`](./participants.

> Note: all individual certificate pdf files are stored in the `output_certificate` sub-directory.

