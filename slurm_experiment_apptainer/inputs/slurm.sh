#!/bin/bash
#SBATCH --account=XXX
#SBATCH --job-name=XXX
#SBATCH --output=logs/slurm.%j.log
#SBATCH --time=0-00:30:00
#SBATCH --qos=devel
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=32
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=XXX

env_file=XXX #set this to full path to env/nextsim.apptainer.sh
echo "Using environment file: $env_file"

# get environment
source $env_file

# Run the model
apptainer exec --cleanenv $NEXTSIM_SIF \
    mpirun -np $SLURM_NTASKS bin/nextsim.exec \
    --config-files=inputs/nextsim.cfg

exit $?
