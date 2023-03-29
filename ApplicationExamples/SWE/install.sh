export COMPILER_LFLAGS="-DMPI2 -lmpi_cxx -lnuma -L/dependencies/ImpalaJIT/build/ -limpalajit -L/dependencies/netcdf-c-4.8.1/lib/lib -lnetcdf -L/usr/lib/x86_64-linux-gnu/ -lyaml-cpp -L/usr/local/lib -lasagi -L/dependencies/easi/build -leasi -lpthread -ltbb"
export COMPILER_CFLAGS=" -I/dependencies/easi/include/"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/usr/local/lib:/dependencies/easi/build"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/dependencies/netcdf-c-4.8.1/lib/lib/"
export SHAREDMEM=TBB
export COMPILER=GNU
#ENV TBB_INC=/usr/include/tbb
#ENV TBB_SHLIB=/usr/lib/x86_64-linux-gnu/libtbb.so
export EXAHYPE_CC=mpicc
export EXAHYPE_FC=mpicc++
export PROJECT_CFLAGS="-DUSE_ASAGI"

cd /ExaHyPE-Tsunami/ApplicationExamples/SWE/ && \
    ../../Toolkit/toolkit.sh SWE_asagi_limited_l0.exahype2 && \
    ../../Toolkit/toolkit.sh SWE_asagi_limited_l1.exahype2 && \
    ../../Toolkit/toolkit.sh SWE_asagi_limited_l2.exahype2

cd /ExaHyPE-Tsunami/ApplicationExamples/SWE/ && \
    cd SWE_asagi_limited_l0    && make -j4 && mkdir Probes && mkdir vtk-output &&\
    cd ../SWE_asagi_limited_l1 && make -j4 && mkdir Probes && mkdir vtk-output && \
    cd ../SWE_asagi_limited_l2 && make -j4 && mkdir Probes && mkdir vtk-output


