#! /usr/bin/bash

# USAGE
# wget https://gitbio.ens-lyon.fr/can/R_basis/-/raw/main/src/create_users_from_user_list_csv.sh
# upload r_user_list_<day_number>_<day>.csv from your computer to the rstudio server
# sudo bash create_users_from_user_list_csv.sh r_user_list_<day_number>_<day>.csv

USER_PASSWORD_FILENAME=$@
while IFS=';' read -r NAME SURNAME EMAIL LAB COMMENT STATUS USERNAME PASSWD ; do
  if [[ $EMAIL =~ "@" ]]
  then
    echo "=========================================="
    echo user: $NAME $SURNAME $EMAIL $LAB
    echo r_login: $USERNAME
    echo r_passwd: $PASSWD
    
    adduser ${USERNAME} --gecos 'First Last,RoomNumber,WorkPhone,HomePhone' --disabled-password --force-badname > /dev/null
    echo "${USERNAME}:${PASSWD}" | chpasswd > /dev/null
  fi
done < $USER_PASSWORD_FILENAME

echo "=========================================="
