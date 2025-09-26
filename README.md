# neXtSIM Support Case
Setup of files needed by support to compile and run nextsim.

## Source code
Clone this repository and the nextsim code into the same folder.
```
git clone git@github.com:nansencenter/nextsim-support-case.git
git clone git@github.com:nansencenter/nextsim.git
cd nextsim
git checkout develop
```

## Meshes and data
Make directories to put meshes and data.
```
mkdir -p data mesh
```
Copy meshes into mesh and forcing files into data.
Example contents of mesh:
```
NpsNextsim.mpp
small_arctic_10km.msh
small_arctic_20km.msh
small_arctic_5km.msh
large_arctic_5km.msh
```
Example contents of data:
```
data/ERA5_d2m_y1996.nc
data/ERA5_msr_y1996.nc
data/ERA5_u10_y1996.nc
data/nextsim.sif
data/ERA5_msdwlwrf_y1996.nc
data/ERA5_mtpr_y1996.nc
data/ERA5_v10_y1996.nc
data/ERA5_msdwswrf_y1996.nc
data/ERA5_q2m_y1996.nc
data/ETOPO_Arctic_2arcmin.nc
data/ERA5_msl_y1996.nc
data/ERA5_t2m_y1996.nc
data/ice_drift_nh_polstere-625_multi-oi.nc
data/1996/ topaz_rean_199601.nc
```

## Apptainer
Build apptainer image on laptop and copy it to HPC.
```
cd apptainer
sudo apptainer build nextsim.sif nextsim.def
mv nextsim.sif ../data
```

## Compile the model
```
. env/nextsim.apptainer.sh
apptainer shell --cleanenv $NEXTSIM_SIF
cd /nextsim
make -j 18
```
This produces an executable called `/nextsim/model/bin/nextsim.exec`.

## Run the model
Make a directory on `$USERWORK` to run the model and copy `slurm_experiment_apptainer/inputs` into it.

Edit `inputs/slurm.sh` to replace `XXX` with suitable values.
```
mkdir bin logs
```
Copy the executable to `bin`, and submit the job with sbatch.
```
sbatch inputs/slurm.sh
```
