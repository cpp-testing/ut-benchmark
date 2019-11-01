all: include assert test

include:
	time $(CXX) -std=c++2a -c -I doctest/include doctest/include.cpp
	time $(CXX) -std=c++2a -O3 -c -I doctest/include doctest/include.cpp
	time $(CXX) -std=c++2a -c -I ut/include ut/include.cpp
	time $(CXX) -std=c++2a -O3 -c -I ut/include ut/include.cpp

assert:
	time $(CXX) -std=c++2a -I doctest/include doctest/assert.cpp
	time ./a.out
	time $(CXX) -std=c++2a -O3 -I doctest/include doctest/assert.cpp
	time ./a.out
	time $(CXX) -std=c++2a -I ut/include ut/assert.cpp
	time ./a.out
	time $(CXX) -std=c++2a -O3 -I ut/include ut/assert.cpp

test:
	time $(CXX) -std=c++2a -I doctest/include doctest/test.cpp
	time ./a.out
	time $(CXX) -std=c++2a -O3 -I doctest/include doctest/test.cpp
	time ./a.out
	time $(CXX) -std=c++2a -I ut/include ut/test.cpp
	time ./a.out
	time $(CXX) -std=c++2a -O3 -I ut/include ut/test.cpp
