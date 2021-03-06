CXX=clang++ CXXFLAGS="-std=c++2a --gcc-toolchain=/usr/lib/gcc9/9.2.0" make &> clang9.bench
CXX=clang++ CXXFLAGS="-g -std=c++2a --gcc-toolchain=/usr/lib/gcc9/9.2.0" make &> clang9.debug.bench
CXX=clang++ CXXFLAGS="-std=c++2a -O3 -DNDEBUG --gcc-toolchain=/usr/lib/gcc9/9.2.0" make &> clang9.release.bench

CXX=g++ CXXFLAGS="-std=c++2a" make &> gcc9.bench
CXX=g++ CXXFLAGS="-g -std=c++2a" make &> gcc9.debug.bench
CXX=g++ CXXFLAGS="-std=c++2a -O3 -DNDEBUG" make &> gcc9.release.bench

CXX=clang++ CXXFLAGS="-std=c++2a -stdlib=libc++" make ut &> ut.clang9.bench
CXX=clang++ CXXFLAGS="-g -std=c++2a -stdlib=libc++" make ut &> ut.clang9.debug.bench
CXX=clang++ CXXFLAGS="-std=c++2a -O3 -DNDEBUG -stdlib=libc++" make ut &> ut.clang9.release.bench
