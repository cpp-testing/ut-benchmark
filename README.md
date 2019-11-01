# Benchmarks

**CXX=clang++9 CXXFLAGS="-std=c++2a"**

* include:doctest *1.29s*
* include:ut *0.42s*
* assert:doctest *1.30s*
* assert:ut *0.48s*
* test:doctest *2.33s*
* test:ut *0.93s*

**CXX=g++9 CXXFLAGS="-std=c++2a"**

* include:doctest *1.77s*
* include:ut *0.50s*
* assert:doctest *1.73s*
* assert:ut *0.59s*
* test:doctest *2.41s*
* test:ut *1.49s*
