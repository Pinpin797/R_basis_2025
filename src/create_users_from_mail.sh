#! /usr/bin/bash

# USAGE
# wget -qO - http://perso.ens-lyon.fr/laurent.modolo/R/create_users_from_mail.sh | tr -d '\r' | bash -s usertest@mail.fr usertest2@mail.f

USERMAILS=$@
for USERMAIL in ${USERMAILS[@]}
do
  USERNAME=$(echo ${USERMAIL} | sed -E 's/(.*)@.*/\1/')
  adduser ${USERNAME} --gecos 'First Last,RoomNumber,WorkPhone,HomePhone' --disabled-password
  PASSWD=$(openssl rand -base64 10)
  echo "${USERNAME}:${PASSWD}" | chpasswd
  echo "======================================================================="
  echo "${USERMAIL}:"
  echo "${USERNAME}"
  echo "${PASSWD}"
done
