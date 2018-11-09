#!/bin/bash
#PBS -l nodes=1:ppn=4,mem=1gb,walltime=00:10:00
#PBS -M je.forero@uniandes.edu.co
#PBS -m abe
#PBS -N ejercicio25


module load anaconda/python3
cd $PBS_O_WORKDIR # este es el directorio desde donde se ejecuto qsub
chmod +x count.sh
./count.sh