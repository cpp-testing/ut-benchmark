CXX=clang++ CXXFLAGS="-std=c++2a --gcc-toolchain=/usr/lib/gcc9/9.2.0" make &> clang9.bench
CXX=clang++ CXXFLAGS="-g -std=c++2a --gcc-toolchain=/usr/lib/gcc9/9.2.0" make &> clang9.debug.bench
CXX=clang++ CXXFLAGS="-O2 -std=c++2a --gcc-toolchain=/usr/lib/gcc9/9.2.0" make &> clang9.O2.bench

CXX=g++ CXXFLAGS="-std=c++2a" make &> gcc9.bench
CXX=g++ CXXFLAGS="-g -std=c++2a" make &> gcc9.debug.bench
CXX=g++ CXXFLAGS="-O2 -std=c++2a" make &> gcc9.O2.bench
