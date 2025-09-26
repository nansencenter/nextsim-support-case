#! /bin/bash

# general paths
sourced=$(readlink -f ${BASH_SOURCE[0]})
env_dir=$(dirname $sourced)
root_dir=$(dirname $env_dir)
src_dir=$(dirname $root_dir)
mesh_dir=$root_dir/mesh
data_dir=$root_dir/data

# nextsim-specific
nextsim_root_dir=$src_dir/nextsim
export NEXTSIM_SIF="$data_dir/nextsim.sif"

# paths to mount
APPTAINER_BINDPATH="$nextsim_root_dir:/nextsim"
APPTAINER_BINDPATH+=",$mesh_dir:/nextsim_mesh_dir"
APPTAINER_BINDPATH+=",$data_dir:/nextsim_data_dir"

export APPTAINER_BINDPATH
