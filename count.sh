#!/bin/bash
divs=50
split -n$divs -d Pi_2500000.txt subfile_d

cc -o cuenta.x cuenta.c
cont=0
ttot=0
for filename in subfile*; do
    fname1="subcuenta$cont.txt"
    fname2="subtiempo$cont"
    ./cuenta.x $filename ${fname1} "${fname2}.txt"
    cont=$((cont+1))
done

for filename in subtiempo*; do
    nttot=$(<$filename)
    echo "nuevo tiempo: $nttot"
    ttot=$(echo $ttot $nttot | awk '{print $1 + $2}')
done
echo "Tiempo total = $ttot"
# Remove created files
rmname="subfile"
rm -rf $rmname*

rmname="subcuenta"
rm -rf $rmname*

rmname="subtiempo"
rm -rf $rmname*