#! /bin/bash

# runtime environment variables
export CC=mpicc
export CXX=mpicxx
export CFLAGS="-O3 -fPIC"
export CXXFLAGS="-O3 -pthread -fPIC -fopenmp"
export CCFLAGS="$CFLAGS"
export OPENMPI_INCLUDE_DIR=/usr/lib/x86_64-linux-gnu/openmpi/include
export MPI_INC_DIR=/usr/lib/x86_64-linux-gnu/openmpi/include
export OPENMPI_LIB_DIR=/usr/lib/x86_64-linux-gnu/openmpi/lib
export NETCDF_DIR=/usr
export BOOST_DIR=/usr
export BOOST_INCDIR=$BOOST_DIR/include
export BOOST_LIBDIR=$BOOST_DIR/lib/x86_64-linux-gnu
export GMSH_DIR=/opt/local/gmsh
export LANG=C.UTF-8
export LC_ALL=C.UTF-8

# where container will expect to find code to compile/run
export NEXTSIMDIR=/nextsim

# update PATH
export PATH=$GMSH_DIR/bin:$PATH

# input and output data
export NEXTSIM_MESH_DIR=/nextsim_mesh_dir
export NEXTSIM_DATA_DIR=/nextsim_data_dir
