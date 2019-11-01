# Benchmarks

**CXX=clang++9 CXXFLAGS="-std=c++2a"**

* include:doctest *1.29s*
* include:ut *0.43s*
* assert:doctest *1.30s*
* assert:ut *0.49s*
* test:doctest *2.33s*
* test:ut *4.26s*

**CXX=g++9 CXXFLAGS="-std=c++2a"**

* include:doctest *1.77s*
* include:ut *0.50s*
* assert:doctest *1.73s*
* assert:ut *0.59s*
* test:doctest *2.41s*
* test:ut *5.88s*
