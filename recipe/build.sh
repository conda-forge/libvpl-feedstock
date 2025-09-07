set -ex

mkdir build
pushd build

# ENABLE_LIBDIR_IN_RUNTIME_SEARCH=ON
# help VPL find runtimes within the conda-forge environment.
# https://github.com/intel/libvpl/issues/119
cmake \
    ${CMAKE_ARGS} \
    -DENABLE_LIBDIR_IN_RUNTIME_SEARCH=ON \
    ..

make -j${CPU_COUNT}

make install

# Don't install the examples
rm -rf ${PREFIX}/share/vpl/examples
