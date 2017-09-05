#!/bin/bash

#MINER NAME
NAME=amir.rig9


## DONT TOUCH THESE
CURDIR=`dirname $0`
echo 'revolux123' | sudo -S `dirname $0`/overclock.sh
####

## YOU CAN CHANGE THIS FROM INFINITE LOOP TO 
## A CONDITIONAL SO IT HAS A FAILSAFE
## AKA A VARIABLE THAT PREVENTS LOOP FROM RUNNING IF PRESENT
##
##
while [ 1 ];
do
#etHASH
${CURDIR}/ethminer/ethminer -U -S us-east.ethash-hub.miningpoolhub.com:12020 -O ${NAME}:x --farm-retries 0 -FS exit

#Groestl
(PIDFILE=$(mktemp /tmp/foo.XXXXXX) && trap "rm $PIDFILE" 0 \
         && { (unbuffer ${CURDIR}/ccminer/ccminer -r 0 -a groestl -o stratum+tcp://hub.miningpoolhub.com:12004 -O ${NAME}:x) \
                  1> >(tee >(grep -q "...terminating workio thread" && kill $(cat $PIDFILE)) >&1) \  #Exit failsafe, groestl sometimes gets stuck
              & PID=$! && echo $PID >$PIDFILE ; wait $PID || true; })

#myr-gr
${CURDIR}/ccminer/ccminer -r 0 -a myr-gr -o stratum+tcp://hub.miningpoolhub.com:12005 -O ${NAME}:x

#Lyra2Rev2
${CURDIR}/ccminer/ccminer -r 0 -a lyra2v2 -o stratum+tcp://hub.miningpoolhub.com:12018 -O ${NAME}:x 

#monero
${CURDIR}/monero/xmrMiner/build/xmrMiner -r 0 -R 4 -l 16x54 -o stratum+tcp://us-east.cryptonight-hub.miningpoolhub.com:12024 -O ${NAME}:x -D

#Feathercoin (NEOSCRYPT)
${CURDIR}/ccminer/ccminer -r 0 -a neoscrypt -o stratum+tcp://hub.miningpoolhub.com:12012 -O ${NAME}:x 

#skein
${CURDIR}/ccminer/ccminer -r 0 -a skein -o stratum+tcp://hub.miningpoolhub.com:12016 -O ${NAME}:x 

#Equihash
(PIDFILE=$(mktemp /tmp/foo.XXXXXX) && trap "rm $PIDFILE" 0 \
         && { (unbuffer ${CURDIR}/zcash/miner --eexit 3 --intensity 64 64 64 64 64 64 64 --cuda_devices 0 1 2 3 4 5 6 --templimit 80 --server us-east.equihash-hub.miningpoolhub.com --port 12023 --user ${NAME} --pass x) \
                  1> >(tee >(grep -q "Total speed: 0 Sol/s" && kill $(cat $PIDFILE)) >&1) \
              & PID=$! && echo $PID >$PIDFILE ; wait $PID || true; })
done

exit 0
