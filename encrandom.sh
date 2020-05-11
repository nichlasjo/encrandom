#!/bin/sh

dec_secret="/var/tmp/secret"
enc_secret="/var/tmp/.secret"
encrypt="openssl enc -e -aes-256-cbc -a -pass "
decrypt="openssl enc -d -aes-256-cbc -a -pass "

printf "0" >/tmp/JOB
if [ $enc_debug = 'True' ]
        then
            set -x
fi

while true
        do
if [ -f $dec_secret ]
        then
            RND="$RANDOM.$RANDOM"
            cat $dec_secret | $encrypt pass:$RND > $enc_secret
            rm $dec_secret
            sleep 5

if [ "$(cat /tmp/JOB)" = 1 ]
        then
            DEC=$(cat $enc_secret | $decrypt pass:$RND); echo $DEC
            RND="$RANDOM.$RANDOM"
            echo $DEC | $encrypt pass:$RND > $enc_secret
            unset DEC
            printf "0" >/tmp/JOB
fi
           sleep 5
done
