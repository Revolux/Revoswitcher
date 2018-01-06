#!/bin/bash

#MINER NAME
NAME=amir.LEG2


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

#BTCZ
#(PIDFILE=$(mktemp /tmp/foo.XXXXXX) && trap "rm $PIDFILE" 0 \
#         && { (unbuffer ${CURDIR}/zcash/miner --eexit 3 --intensity 64 --cuda_devices 0 1 2 3 4 5 6 --templimit 80 --server btcz.suprnova.cc --port 5587 --user ak.rig3 --pass x) \
#                  1> >(tee >(grep -q "Total speed: 0 Sol/s" && kill $(cat $PIDFILE)) >&1) \
#              & PID=$! && echo $PID >$PIDFILE ; wait $PID || true; }) 1> >(tee >(grep -q "ERROR: unknown error" && (echo 'revolux123' | sudo -S reboot) >&1))

#etHASH
(PIDFILE=$(mktemp /tmp/foo.XXXXXX) && trap "rm $PIDFILE" 0 \
         && { (unbuffer ${CURDIR}/ethminer/ethminer -U -S us-east.ethash-hub.miningpoolhub.com:12020 -O ${NAME}:x --farm-retries 0 -FS exit) \
                  1> >(tee >(grep -q "unspecified launch failure" && kill $(cat $PIDFILE)) >&1) \
              & PID=$! && echo $PID >$PIDFILE ; wait $PID || true; })

#Groestl
(PIDFILE=$(mktemp /tmp/foo.XXXXXX) && trap "rm $PIDFILE" 0 \
         && { (unbuffer ${CURDIR}/ccminer/ccminer -r 0 -a groestl -o stratum+tcp://hub.miningpoolhub.com:12004 -O ${NAME}:x) \
                  1> >(tee >(grep -q "...terminating workio thread" && kill $(cat $PIDFILE)) >&1) \
              & PID=$! && echo $PID >$PIDFILE ; wait $PID || true; })

#myr-gr
(PIDFILE=$(mktemp /tmp/foo.XXXXXX) && trap "rm $PIDFILE" 0 \
         && { (unbuffer ${CURDIR}/ccminer/ccminer -r 0 -a myr-gr -o stratum+tcp://hub.miningpoolhub.com:12005 -O ${NAME}:x) \
                  1> >(tee >(grep -q "...terminating workio thread" && kill $(cat $PIDFILE)) >&1) \
              & PID=$! && echo $PID >$PIDFILE ; wait $PID || true; })

#Lyra2Rev2
(PIDFILE=$(mktemp /tmp/foo.XXXXXX) && trap "rm $PIDFILE" 0 \
         && { (unbuffer ${CURDIR}/ccminer/ccminer -r 0 -a lyra2v2 -o stratum+tcp://hub.miningpoolhub.com:12018 -O ${NAME}:x) \
                  1> >(tee >(grep -q "...terminating workio thread" && kill $(cat $PIDFILE)) >&1) \
              & PID=$! && echo $PID >$PIDFILE ; wait $PID || true; })


#Cryptonight
${CURDIR}/xmrMiner/build/xmrMiner -r 0 -R 4 -l 16x54 -o stratum+tcp://us-east.cryptonight-hub.miningpoolhub.com:12024 -O ${NAME}:x -D

#Feathercoin (NEOSCRYPT)
(PIDFILE=$(mktemp /tmp/foo.XXXXXX) && trap "rm $PIDFILE" 0 \
         && { (unbuffer ${CURDIR}/ccminer/ccminer -r 0 -a neoscrypt -o stratum+tcp://hub.miningpoolhub.com:12012 -O ${NAME}:x) \
                  1> >(tee >(grep -q "...terminating workio thread" && kill $(cat $PIDFILE)) >&1) \
              & PID=$! && echo $PID >$PIDFILE ; wait $PID || true; }) 

#skein
(PIDFILE=$(mktemp /tmp/foo.XXXXXX) && trap "rm $PIDFILE" 0 \
         && { (unbuffer ${CURDIR}/ccminer/ccminer -r 0 -a skein -o stratum+tcp://hub.miningpoolhub.com:12016 -O ${NAME}:x ) \
                  1> >(tee >(grep -q "...terminating workio thread" && kill $(cat $PIDFILE)) >&1) \
              & PID=$! && echo $PID >$PIDFILE ; wait $PID || true; }) 

#Equihash
(PIDFILE=$(mktemp /tmp/foo.XXXXXX) && trap "rm $PIDFILE" 0 \
         && { (unbuffer ${CURDIR}/zcash/miner --eexit 3 --intensity 64 64 64 64 64 64 64 --cuda_devices 0 1 2 3 4 5 6 --templimit 80 --server us-east.equihash-hub.miningpoolhub.com --port 12023 --user ${NAME} --pass x) \
                  1> >(tee >(grep -q "Total speed: 0 Sol/s" && kill $(cat $PIDFILE)) >&1) \
              & PID=$! && echo $PID >$PIDFILE ; wait $PID || true; }) 1> >(tee >(grep -q "ERROR: unknown error" && (echo 'revolux123' | sudo -S reboot) >&1))
done


exit 0
