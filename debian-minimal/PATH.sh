export BASEDIR=${PWD}/..
export INSTALL_PREFIX=${PWD}/local
export PATH=${INSTALL_PREFIX}/bin:$PATH
export LD_LIBRARY_PATH=${INSTALL_PREFIX}/lib64:${INSTALL_PREFIX}/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=${INSTALL_PREFIX}/lib64/pkgconfig:${INSTALL_PREFIX}/lib/pkgconfig:${INSTALL_PREFIX}/share/pkgconfig:$PKG_CONFIG_PATH
export CC=clang-3.8
export CXX=clang++-3.8
export F77=gfortran
# -DCMAKE_PREFIX_PATH= is for alberta
export CMAKE_FLAGS="-DCMAKE_PREFIX_PATH=$INSTALL_PREFIX -DEIGEN3_INCLUDE_DIR=$INSTALL_PREFIX/include/eigen3 -DDUNE_XT_WITH_PYTHON_BINDINGS=TRUE"
[ -e ${INSTALL_PREFIX}/bin/activate ] && . ${INSTALL_PREFIX}/bin/activate
export OMP_NUM_THREADS=1
