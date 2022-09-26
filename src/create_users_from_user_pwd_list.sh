#! /usr/bin/bash

# USAGE
# wget https://gitbio.ens-lyon.fr/can/R_basis/-/raw/master/src/create_users_from_user_pwd_list.sh
# upload X_user_pwd_list.tsv from your computer to the rstudio server
# sudo bash create_users_from_user_pwd_list.sh X_user_pwd_list.tsv

USER_PASSWORD_FILENAME=$@
while IFS=$'\t' read -r GROUPE NAME SURNAME MAIL LOGIN_CBP PASSWD_CBP LABO R_USERNAME R_PASSWD ; do
  if [[ $MAIL =~ "@" ]]
  then
    echo "=========================================="
    echo user: $NAME $SURNAME $MAIL $LABO group:$GROUPE
    if ! [[ $GROUPE =~ "L" ]]
    then 
        echo computer_login: $LOGIN_CBP
        echo computer_passwd: $PASSWD_CBP
    else 
        echo computer_login: "TP"
        echo computer_passwd: 
    fi
    echo r_login: $R_USERNAME
    echo r_passwd: $R_PASSWD
    
    adduser ${R_USERNAME} --gecos 'First Last,RoomNumber,WorkPhone,HomePhone' --disabled-password --force-badname > /dev/null
    echo "${R_USERNAME}:${R_PASSWD}" | chpasswd > /dev/null
  fi
done < $USER_PASSWORD_FILENAME

echo "=========================================="