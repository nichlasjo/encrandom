# Encrandom encrypt secret and decrypt if jobstatus is one.
* - monitor with - watch cat /var/tmp/.secret

 0. ./encrandom.sh

 1. printf "This is my secret" > /var/tmp/secret

 2. printf "1" > /tmp/JOB

 *Had some ~~old fart~~ friend telling me to not trust services that can read my password upon requests to reset.*
 *In disbelief i gasped but that is easy to implement even in sh why would they do such a thing ?*
 *they do not care he answered.*
