#! /bin/bash

# general paths
sourced=$(readlink -f ${BASH_SOURCE[0]})
env_dir=$(dirname $sourced)
root_dir=$(dirname $env_dir)
src_dir=$(dirname $root_dir)
mesh_dir=$root_dir/mesh
data_dir=$root_dir/data

# folder with larger data for forcing the model
project_dir=/cluster/projects/nn9878k/sim

# nextsim-specific
nextsim_root_dir=$src_dir/nextsim
export NEXTSIM_SIF="$data_dir/nextsim.sif"

# paths to mount
APPTAINER_BINDPATH="$nextsim_root_dir:/nextsim"
APPTAINER_BINDPATH+=",$mesh_dir:/nextsim_mesh_dir"
APPTAINER_BINDPATH+=",$data_dir:/nextsim_data_dir"

# if project_dir is present, mount it also, without remapping the path
[[ -d $project_dir ]] && \
    APPTAINER_BINDPATH+=",$project_dir"
export APPTAINER_BINDPATH
