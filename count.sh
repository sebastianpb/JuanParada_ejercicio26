#!/bin/bash

times=(0 0 0 0 0)  # To store times


cc -o cuenta.x cuenta.c
cont=0
ttot=0
./cuenta.x Pi_2500000.txt cuenta.txt tiempo.txt
filename=tiempo.txt
nttot=$(<$filename)
times[0]=$nttot




divs=10
echo "%%%%%%%%%%%%%%%%%%% DIVISIONES: $divs %%%%%%%%%%%%%%%%%%%%%"

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

times[1]=$nttot
# Remove created files
rmname="subfile"
rm -rf $rmname*

rmname="subcuenta"
rm -rf $rmname*

rmname="subtiempo"
rm -rf $rmname*



divs=20
echo "%%%%%%%%%%%%%%%%%%% DIVISIONES: $divs %%%%%%%%%%%%%%%%%%%%%"
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
times[2]=$nttot
# Remove created files
rmname="subfile"
rm -rf $rmname*

rmname="subcuenta"
rm -rf $rmname*

rmname="subtiempo"
rm -rf $rmname*



divs=50
echo "%%%%%%%%%%%%%%%%%%% DIVISIONES: $divs %%%%%%%%%%%%%%%%%%%%%"
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
times[3]=$nttot
# Remove created files
rmname="subfile"
rm -rf $rmname*

rmname="subcuenta"
rm -rf $rmname*

rmname="subtiempo"
rm -rf $rmname*



divs=100

echo "%%%%%%%%%%%%%%%%%%% DIVISIONES: $divs %%%%%%%%%%%%%%%%%%%%%"
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
    #echo "nuevo tiempo: $nttot"
    ttot=$(echo $ttot $nttot | awk '{print $1 + $2}')
done
echo "Tiempo total = $ttot"
times[4]=$nttot
# Remove created files
rmname="subfile"
rm -rf $rmname*

rmname="subcuenta"
rm -rf $rmname*

rmname="subtiempo"
rm -rf $rmname*

printf "%s\n" "${times[@]}"

python plot.py ${times[0]} ${times[1]} ${times[2]} ${times[3]} ${times[4]}