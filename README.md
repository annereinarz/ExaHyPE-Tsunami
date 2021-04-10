# This is the ExaHyPE project 

This repository mainly exists to run the Tohoku tsunami scenario via https://hub.docker.com/r/linusseelinger/exahype.

The supermuc branch archives the version of ExaHyPE used to run a MLMCMC via MUQ. To use the code outside of the docker container, ExaHyPE's external dependencies have to be installed:

    git clone https://github.com/uphoffc/ImpalaJIT.git
    cd ImpalaJIT/ && mkdir build && cd build && cmake -DSHARED_LIB=1 .. && make && make install

    git clone --recursive https://github.com/TUM-I5/ASAGI.git
    cd ASAGI/ &&  mkdir build && cd build &&  cmake .. && make && make install

    git clone https://github.com/SeisSol/easi.git
    cd easi && git checkout 18382bf60204c67782057fc371c1e699c9bb31b0
    mkdir build && cd build && CC=mpicc CXX=mpicxx cmake .. && make

Ensure that all corresponding enviroment variables are set.

For any other applications or uses please refer to the main ExaHyPE repository at: https://gitlab.lrz.de/exahype/ExaHyPE-Engine
This also contains a wiki and mini installation guide.

* This project has received funding from the European Union’s Horizon 2020 research and innovation programme under grant agreement No 671698.
