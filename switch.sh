#!/bin/bash

#MINER NAME
NAME=amir.ethos2


## DONT TOUCH THESE
CURDIR=`dirname $0`
#echo 'revolux123' | sudo -S `dirname $0`/overclock.sh
####

## YOU CAN CHANGE THIS FROM INFINITE LOOP TO 
## A CONDITIONAL SO IT HAS A FAILSAFE
## AKA A VARIABLE THAT PREVENTS LOOP FROM RUNNING IF PRESENT
##
##
while [ 1 ];
do
#etHASH
${CURDIR}/ethminer/ethminer -G -S us-east.ethash-hub.miningpoolhub.com:12020 -O ${NAME}:x --farm-retries 0 -FS exit

#monero
#${CURDIR}/monero/xmrMiner/build/xmrMiner -r 0 -R 4 -l 16x54 -o stratum+tcp://us-east.cryptonight-hub.miningpoolhub.com:12024 -O ${NAME}:x -D
(PIDFILE=$(mktemp /tmp/foo.XXXXXX) && trap "rm $PIDFILE" 0 \
         && { (unbuffer ${CURDIR}/sgminer-gm/sgminer --event-on idle --event-quit true -k cryptonight -o stratum+tcp://us-east.cryptonight-hub.miningpoolhub.com:12024 -u ${NAME} -p x -o exit) \
                  1> >(tee >(grep -q "Press any key to exit" && kill $(cat $PIDFILE)) >&1) \
              & PID=$! && echo $PID >$PIDFILE ; wait $PID || true; })

(PIDFILE=$(mktemp /tmp/foo.XXXXXX) && trap "rm $PIDFILE" 0 \
         && { (unbuffer ${CURDIR}/sgminer-gm/sgminer --event-on idle --event-quit true -k vanilla -o stratum+tcp://hub.miningpoolhub.com:12019 -u ${NAME} -p x -o exit) \
                  1> >(tee >(grep -q "Press any key to exit" && kill $(cat $PIDFILE)) >&1) \
              & PID=$! && echo $PID >$PIDFILE ; wait $PID || true; })
(PIDFILE=$(mktemp /tmp/foo.XXXXXX) && trap "rm $PIDFILE" 0 \
         && { (unbuffer ${CURDIR}/sgminer-gm/sgminer --event-on idle --event-quit true -k groestlcoin -o stratum+tcp://hub.miningpoolhub.com:12004 -u ${NAME} -p x) \
                  1> >(tee >(grep -q "Press any key to exit" && kill $(cat $PIDFILE)) >&1) \
              & PID=$! && echo $PID >$PIDFILE ; wait $PID || true; })
(PIDFILE=$(mktemp /tmp/foo.XXXXXX) && trap "rm $PIDFILE" 0 \
         && { (unbuffer ${CURDIR}/sgminer-gm/sgminer --event-on idle --event-quit true -k myriadcoin-groestl -o stratum+tcp://hub.miningpoolhub.com:12005 -u ${NAME} -p x) \
                  1> >(tee >(grep -q "Press any key to exit" && kill $(cat $PIDFILE)) >&1) \
              & PID=$! && echo $PID >$PIDFILE ; wait $PID || true; })
(PIDFILE=$(mktemp /tmp/foo.XXXXXX) && trap "rm $PIDFILE" 0 \
         && { (unbuffer ${CURDIR}/sgminer-gm/sgminer --event-on idle --event-quit true -k neoscrypt -o stratum+tcp://hub.miningpoolhub.com:12012 -u ${NAME} -p x) \
                  1> >(tee >(grep -q "Press any key to exit" && kill $(cat $PIDFILE)) >&1) \
              & PID=$! && echo $PID >$PIDFILE ; wait $PID || true; })
(PIDFILE=$(mktemp /tmp/foo.XXXXXX) && trap "rm $PIDFILE" 0 \
         && { (unbuffer ${CURDIR}/sgminer-gm/sgminer --event-on idle --event-quit true -k quarkcoin -o stratum+tcp://hub.miningpoolhub.com:12015 -u ${NAME} -p x) \
                  1> >(tee >(grep -q "Press any key to exit" && kill $(cat $PIDFILE)) >&1) \
              & PID=$! && echo $PID >$PIDFILE ; wait $PID || true; })
(PIDFILE=$(mktemp /tmp/foo.XXXXXX) && trap "rm $PIDFILE" 0 \
         && { (unbuffer ${CURDIR}/sgminer-gm/sgminer --event-on idle --event-quit true -k qubitcoin -o stratum+tcp://hub.miningpoolhub.com:12014 -u ${NAME} -p x) \
                  1> >(tee >(grep -q "Press any key to exit" && kill $(cat $PIDFILE)) >&1) \
              & PID=$! && echo $PID >$PIDFILE ; wait $PID || true; })
(PIDFILE=$(mktemp /tmp/foo.XXXXXX) && trap "rm $PIDFILE" 0 \
         && { (unbuffer ${CURDIR}/sgminer-gm/sgminer --event-on idle --event-quit true -k skeincoin -o stratum+tcp://hub.miningpoolhub.com:12016 -u ${NAME} -p x) \
                  1> >(tee >(grep -q "Press any key to exit" && kill $(cat $PIDFILE)) >&1) \
              & PID=$! && echo $PID >$PIDFILE ; wait $PID || true; })
(PIDFILE=$(mktemp /tmp/foo.XXXXXX) && trap "rm $PIDFILE" 0 \
         && { (unbuffer ${CURDIR}/sgminer-gm/sgminer --event-on idle --event-quit true -k darkcoin-mod -o stratum+tcp://hub.miningpoolhub.com:12007 -u ${NAME} -p x) \
                  1> >(tee >(grep -q "Press any key to exit" && kill $(cat $PIDFILE)) >&1) \
              & PID=$! && echo $PID >$PIDFILE ; wait $PID || true; })
(PIDFILE=$(mktemp /tmp/foo.XXXXXX) && trap "rm $PIDFILE" 0 \
         && { (unbuffer ${CURDIR}/sgminer-gm/sgminer --event-on idle --event-quit true -k marucoin-mod -o stratum+tcp://hub.miningpoolhub.com:12008 -u ${NAME} -p x) \
                  1> >(tee >(grep -q "Press any key to exit" && kill $(cat $PIDFILE)) >&1) \
              & PID=$! && echo $PID >$PIDFILE ; wait $PID || true; })
(PIDFILE=$(mktemp /tmp/foo.XXXXXX) && trap "rm $PIDFILE" 0 \
         && { (unbuffer ${CURDIR}/sgminer-gm/sgminer --event-on idle --event-quit true -k bitblock -o stratum+tcp://hub.miningpoolhub.com:12009 -u ${NAME} -p x) \
                  1> >(tee >(grep -q "Press any key to exit" && kill $(cat $PIDFILE)) >&1) \
              & PID=$! && echo $PID >$PIDFILE ; wait $PID || true; })
(PIDFILE=$(mktemp /tmp/foo.XXXXXX) && trap "rm $PIDFILE" 0 \
         && { (unbuffer ${CURDIR}/sgminer-gm/sgminer --event-on idle --event-quit true -k lyra2rev2 -o stratum+tcp://hub.miningpoolhub.com:12018 -u ${NAME} -p x) \
                  1> >(tee >(grep -q "Press any key to exit" && kill $(cat $PIDFILE)) >&1) \
              & PID=$! && echo $PID >$PIDFILE ; wait $PID || true; })
(PIDFILE=$(mktemp /tmp/foo.XXXXXX) && trap "rm $PIDFILE" 0 \
         && { (unbuffer ${CURDIR}/optiminer-zcash/optiminer-zcash -i 50 -s us-east.equihash-hub.miningpoolhub.com:12023 -u ${NAME} -p x) \
                  1> >(tee >(grep -q "ERROR" && kill $(cat $PIDFILE)) >&1) \
              & PID=$! && echo $PID >$PIDFILE ; wait $PID || true; })



done

exit 0

