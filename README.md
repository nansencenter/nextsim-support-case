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
