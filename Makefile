#all: include.benchmark assert.benchmark test.benchmark
all: suite.benchmark

%.benchmark: clean
	@echo -n "$*:googletest "
	@time -f%e $(CXX) $(CXXFLAGS) -I googletest/include googletest/$*.cpp googletest/lib/libgtest_main.a googletest/lib/libgtest.a -lpthread
	@time -f%e ./a.out

	@echo -n "$*:catch2 "
	@time -f%e $(CXX) $(CXXFLAGS) -I catch2/include catch2/$*.cpp
	@time -f%e ./a.out

	@echo -n "$*:doctest "
	@time -f%e $(CXX) $(CXXFLAGS) -I doctest/include doctest/$*.cpp
	@time -f%e ./a.out

	@echo -n "$*:ut "
	@time -f%e $(CXX) $(CXXFLAGS) -I ut/include ut/$*.cpp
	@time -f%e ./a.out

%.suite: clean
  for ((v=0; v<100; ++v)); do (echo '<% n=100; v=' $v '%>' && cat googletest/suite.erb) | erb > googletest_suite_$v.cpp; done

#function compile {
  #for ((v=0; v<100; ++v)); do
    #g++ -c -I. -std=c++2a suite_$v.cpp
  #done
  #g++ -c -I. -std=c++2a $SUT/main.cpp
  #g++ -I. -std=c++2a *.o
#}


clean:
	@rm -f *.o *.out
