#!/bin/bash
#PBS -N rf
#PBS -l select=1:ncpus=4,walltime=00:05:00
#PBS -q qexp
#PBS -e rf.e
#PBS -o rf.o

cd ~/KPMS-IT4I-EX/code
pwd

## module names can vary on different platforms
module load R
echo "loaded R"

## prevent warning when fork is used with MPI
#export OMPI_MCA_mpi_warn_on_fork=0
#export RDMAV_FORK_SAFE=1

time Rscript rf_serial.r
time Rscript rf_mc.r 1
time Rscript rf_mc.r 2
time Rscript rf_mc.r 4
