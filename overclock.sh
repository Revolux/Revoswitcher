#!/bin/bash
## DO NOT MODIFY ANYTHING OTHER THAN WHAT IS INDICATED BY THESE COMMENTS
##
####
####
#WARNING: DO NOT MODIFY THIS FILE UNLESS YOU KNOW WHAT YOU ARE DOING#
# IF YOU ARE UNSURE ABOUT ANYTHING IN THIS FILE, DO NOT EDIT #
# HEAVY OVERCLOCKING OF THE CARDS CAN RESULT IN DRAMATIC PERFORMANCE INCREASES, BUT WILL ALSO DRAMATICALLY REDUCE THE LIFE OF YOUR RIG #
# BY MODIFYING THIS FILE, YOU AGREE TO ASSUME ALL LIABILITIES #

## CHANGE THIS TO INCREASE GPU CORE CLOCK VALUE ##
## This is NOT an absolute value, it is additive. ##
## For example, CLOCK=60 means the core clock will be increased 
## By 60Mhz OVER the stock value ## 
## Range should typically be between 0-200 without additional power supply tweaking ##
CLOCK=40

## CHANGE THIS TO INCREASE GPU MEMORY CLOCK VALUE ##
## This is NOT an absolute value, it is additive. ##
## For example, MEM=1500 means the Memory clock will be increased
## By 1500Mhz OVER the original stock value ##
## Range should typically be between 0-2000 without additional power supply and VBIOS tweaking ##
MEM=1200
 

CMD='/usr/bin/nvidia-settings'
echo "performance" >/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "performance" >/sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo 2800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 2800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq

for i in {0..6}
  do
    nvidia-smi -i ${i} -pm 0
    nvidia-smi -i ${i} -pl 140
    ${CMD} -a [gpu:${i}]/GPUPowerMizerMode=1
    ${CMD} -a [gpu:${i}]/GPUFanControlState=1

## CHANGE THIS TO INCREASE/DECREASE FAN SPEEDS ##
## GPUTargetFanSpeed=92 means fans will run at 92% ##
## Fans are super quiet under ~88% ##
## Running fans at 100% continuously will degrade their life ##
    ${CMD} -a [fan:${i}]/GPUTargetFanSpeed=92

    for x in {3..3}
      do
        ${CMD} -a [gpu:${i}]/GPUGraphicsClockOffset[${x}]=${CLOCK}
        ${CMD} -a [gpu:${i}]/GPUMemoryTransferRateOffset[${x}]=${MEM}
    done

done
