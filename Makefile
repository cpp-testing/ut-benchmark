#all: include.benchmark assert.benchmark test.benchmark
all: suite.benchmark

N=1

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

suite.benchmark:
	#@make clean
	#@echo -n "$*:googletest "
	#@for ((v=0; v<$(N); ++v)); do (echo '<% n=$(N); v=' $$v '%>' && cat googletest/suite.erb) | erb > googletest_suite_$$v.cpp; done
	#@time -f%e make suite.compile.googletest
	#@time -f%e ./a.out

	#@make clean
	#@echo -n "$*:catch2 "
	#@for ((v=0; v<$(N); ++v)); do (echo '<% n=$(N); v=' $$v '%>' && cat catch2/suite.erb) | erb > catch2_suite_$$v.cpp; done
	#@time -f%e make suite.compile.catch2
	#@time -f%e ./a.out

	#@make clean
	#@echo -n "$*:doctest "
	#@for ((v=0; v<$(N); ++v)); do (echo '<% n=$(N); v=' $$v '%>' && cat doctest/suite.erb) | erb > doctest_suite_$$v.cpp; done
	#@time -f%e make suite.compile.doctest
	#@time -f%e ./a.out

	@make clean
	@echo -n "$*:ut "
	@for ((v=0; v<$(N); ++v)); do (echo '<% n=$(N); v=' $$v '%>' && cat ut/suite.erb) | erb > ut_suite_$$v.cpp; done
	@time -f%e make suite.compile.ut
	@time -f%e ./a.out

suite.compile.googletest:
	@for ((v=0; v<$(N); ++v)); do $(CXX) $(CXXFLAGS) -I googletest/include -c googletest_suite_$$v.cpp; done; $(CXX) $(CXXFLAGS) *.o -lpthread googletest/lib/libgtest_main.a googletest/lib/libgtest.a

suite.compile.catch2:
	@for ((v=0; v<$(N); ++v)); do $(CXX) $(CXXFLAGS) -I catch2/include -c catch2_suite_$$v.cpp; done; $(CXX) $(CXXFLAGS) -I catch2/include *.o catch2/main.cpp

suite.compile.doctest:
	@for ((v=0; v<$(N); ++v)); do $(CXX) $(CXXFLAGS) -I doctest/include -c doctest_suite_$$v.cpp; done; $(CXX) $(CXXFLAGS) -I doctest/include *.o doctest/main.cpp

suite.compile.ut:
	@for ((v=0; v<$(N); ++v)); do $(CXX) $(CXXFLAGS) -I ut/include -c ut_suite_$$v.cpp; done; $(CXX) $(CXXFLAGS) -I ut/include *.o ut/main.cpp

clean:
	@rm -f *.o *.out *.cpp
