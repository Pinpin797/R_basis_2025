#!/bin/bash

if [[ ! -d output_certificate ]]; then mkdir output_certificate; fi

while IFS= read -r line; do
    echo "processing $line"
    NUM=$(echo "$line" | cut -d\, -f1 | tr -d ' ')
    FIRSTNAME=$(echo "$line" | cut -d\, -f2 | tr -d ' ')
    LASTNAME=$(echo "$line" | cut -d\, -f3 | tr -d ' ')
    FILENAME="CAN_R_training_fall_2023_attendance_certificate_${FIRSTNAME}_${LASTNAME}.pdf"
    echo $FILENAME
    qpdf --empty --pages certificate.pdf $NUM -- output_certificate/$FILENAME
done < <(tail -n "+2" participants.csv)

