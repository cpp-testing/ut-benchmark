all: include.benchmark assert.benchmark test.benchmark suite.benchmark

N?=100

%.benchmark: clean
	@echo -n "$*:googletest "
	@time -f%e $(CXX) $(CXXFLAGS) -I googletest/include googletest/$*.cpp googletest/lib/libgtest_main.a googletest/lib/libgtest.a -lpthread
	@time -f%e ./a.out
	@ls -lh a.out

	@echo -n "$*:catch2 "
	@time -f%e $(CXX) $(CXXFLAGS) -I catch2/include catch2/$*.cpp
	@time -f%e ./a.out
	@ls -lh a.out

	@echo -n "$*:doctest "
	@time -f%e $(CXX) $(CXXFLAGS) -I doctest/include doctest/$*.cpp
	@time -f%e ./a.out
	@ls -lh a.out

	@echo -n "$*:ut "
	@time -f%e $(CXX) $(CXXFLAGS) -I ut/include ut/$*.cpp
	@time -f%e ./a.out
	@ls -lh a.out

suite.benchmark suite+assert.benchmark:
	@make $@.explicit

%.benchmark.explicit:
	@make clean
	@echo -n "$*:googletest "
	@for ((v=0; v<$(N); ++v)); do (echo '<% n=$(N); v=' $$v '%>' && cat googletest/$*.erb) | erb > googletest_suite_$$v.cpp; done
	@time -f%e make suite.compile.googletest
	@time -f%e ./a.out
	@ls -lh a.out

	@make clean
	@echo -n "$*:catch2 "
	@for ((v=0; v<$(N); ++v)); do (echo '<% n=$(N); v=' $$v '%>' && cat catch2/$*.erb) | erb > catch2_suite_$$v.cpp; done
	@time -f%e make suite.compile.catch2
	@time -f%e ./a.out
	@ls -lh a.out

	@make clean
	@echo -n "$*:doctest "
	@for ((v=0; v<$(N); ++v)); do (echo '<% n=$(N); v=' $$v '%>' && cat doctest/$*.erb) | erb > doctest_suite_$$v.cpp; done
	@time -f%e make suite.compile.doctest
	@time -f%e ./a.out
	@ls -lh a.out

	@make clean
	@echo -n "$*:ut "
	@for ((v=0; v<$(N); ++v)); do (echo '<% n=$(N); v=' $$v '%>' && cat ut/$*.erb) | erb > ut_suite_$$v.cpp; done
	@time -f%e make suite.compile.ut
	@time -f%e ./a.out
	@ls -lh a.out

suite.compile.googletest:
	@for ((v=0; v<$(N); ++v)); do $(CXX) $(CXXFLAGS) -I googletest/include -c googletest_suite_$$v.cpp; done; $(CXX) $(CXXFLAGS) -lpthread googletest/lib/libgtest_main.a googletest/lib/libgtest.a *.o

suite.compile.catch2:
	@for ((v=0; v<$(N); ++v)); do $(CXX) $(CXXFLAGS) -I catch2/include -c catch2_suite_$$v.cpp; done; $(CXX) $(CXXFLAGS) -I catch2/include catch2/main.cpp *.o

suite.compile.doctest:
	@for ((v=0; v<$(N); ++v)); do $(CXX) $(CXXFLAGS) -I doctest/include -c doctest_suite_$$v.cpp; done; $(CXX) $(CXXFLAGS) -I doctest/include doctest/main.cpp *.o

suite.compile.ut:
	@for ((v=0; v<$(N); ++v)); do $(CXX) $(CXXFLAGS) -I ut/include -c ut_suite_$$v.cpp; done; $(CXX) $(CXXFLAGS) -I ut/include ut/main.cpp *.o

clean:
	@rm -f *.o *.out *.cpp
