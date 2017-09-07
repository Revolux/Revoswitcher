#!/bin/bash
#Remove the "#" before a certain line to activate that algorithm. 
#WARNING: BE SURE THAT ALL OTHER LINES ARE COMMENTED OUT WITH "#"
# DO NOT START MINER WITH MORE THAN ONE ALGORITHM UNCOMMENTED

#Don't touch this line
echo 'revolux123' | sudo -S /home/revolux/Desktop/overclock.sh
######

#Myriad-Groestl
/home/revolux/Desktop/ccminer/ccminer -a groestl -o stratum+tcp://hub.miningpoolhub.com:17004 -O amir.rig9:x 

#Monero - Cryptonight
#/home/revolux/Desktop/ccminer -a cryptonight -o stratum+tcp://YOUR-MINING-POOL-ADDRES:PORT -O WALLETNAME.RIG-NAME:PASSWORD 

#Decred
#/home/revolux/Desktop/ccminer -a decred -o stratum+tcp://YOUR-MINING-POOL-ADDRES:PORT -O WALLETNAME.RIG-NAME:PASSWORD 

#LBRY Credits
#/home/revolux/Desktop/ccminer -a lbry -o stratum+tcp://YOUR-MINING-POOL-ADDRES:PORT -O WALLETNAME.RIG-NAME:PASSWORD 


