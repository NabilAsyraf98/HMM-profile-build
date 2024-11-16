#!/bin/bash
#SBATCH -p sapphire
#SBATCH --job-name=HMMER-test.slurm
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH -t 0:15:00
#SBATCH --mail-user=your@email
#SBATCH --mail-type=ALL

module purge
module load foss/2022a
module load HMMER/3.3.2

seqmagick convert --output-format stockholm [fasta file] [sto file] 
hmmbuild [name of hmm profile] [sto file]
hmmsearch --domE 1e-5 --incdomE 1e-5 [hmm profile] [protein database] > output.out
hmmsearch --domE 1e-5 --incdomE 1e-5 --tblout output.txt [hmm profile] [protein database]

##DO NOT ADD/EDIT BEYOND THIS LINE##
##Job monitor command to list the resource usage
my-job-stats -a -n -s

