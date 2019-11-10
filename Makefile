all: include.benchmark assert.benchmark test.benchmark

%.benchmark: clean
	@echo -n "$*:catch2 "
	@time -f%e $(CXX) $(CXXFLAGS) -I catch2/include catch2/$*.cpp
	@time -f%e ./a.out

	@echo -n "$*:doctest "
	@time -f%e $(CXX) $(CXXFLAGS) -I doctest/include doctest/$*.cpp
	@time -f%e ./a.out

	@echo -n "$*:ut "
	@time -f%e $(CXX) $(CXXFLAGS) -I ut/include ut/$*.cpp
	@time -f%e ./a.out

clean:
	@rm -f *.o *.out
