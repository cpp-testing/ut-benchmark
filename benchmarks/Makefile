N?=100

all: include.benchmark assert.benchmark test.benchmark suite.benchmark suite+assert.benchmark suite+assert+stl.benchmark
	@make clean

ut:	ut.suite+assert+stl.benchmark
	@make clean

%.benchmark: clean
	@time -f"$*:googletest %e" $(CXX) $(CXXFLAGS) -I googletest/include googletest/$*.cpp googletest/lib/libgtest_main.a googletest/lib/libgtest.a -lpthread
	@time -f"$*:googletest %e" ./a.out
	@ls -l a.out | cut -d' ' -f6 | xargs echo "$*:googletest"

	@time -f"$*:catch2 %e" $(CXX) $(CXXFLAGS) -I catch2/include catch2/$*.cpp
	@time -f"$*:catch2 %e" ./a.out
	@ls -l a.out | cut -d' ' -f6 | xargs echo "$*:catch2"

	@time -f"$*:doctest %e" $(CXX) $(CXXFLAGS) -I doctest/include doctest/$*.cpp
	@time -f"$*:doctest %e" ./a.out
	@ls -l a.out | cut -d' ' -f6 | xargs echo "$*:doctest"

	@time -f"$*:ut %e" $(CXX) $(CXXFLAGS) -I ut/include ut/$*.cpp
	@time -f"$*:ut %e" ./a.out
	@ls -l a.out | cut -d' ' -f6 | xargs echo "$*:ut"

suite.benchmark suite+assert.benchmark suite+assert+stl.benchmark:
	@make $@.explicit

%.benchmark.explicit:
	@make clean
	@for ((v=0; v<$(N); ++v)); do (echo '<% n=$(N); v=' $$v '%>' && cat googletest/$*.erb) | erb > googletest_suite_$$v.cpp; done
	@time -f"$*:googletest %e" make suite.compile.googletest
	@time -f"$*:googletest %e" ./a.out
	@ls -l a.out | cut -d' ' -f6 | xargs echo "$*:googletest"

	@make clean
	@for ((v=0; v<$(N); ++v)); do (echo '<% n=$(N); v=' $$v '%>' && cat catch2/$*.erb) | erb > catch2_suite_$$v.cpp; done
	@time -f"$*:catch2 %e" make suite.compile.catch2
	@time -f"$*:catch2 %e" ./a.out
	@ls -l a.out | cut -d' ' -f6 | xargs echo "$*:catch2"

	@make clean
	@for ((v=0; v<$(N); ++v)); do (echo '<% n=$(N); v=' $$v '%>' && cat doctest/$*.erb) | erb > doctest_suite_$$v.cpp; done
	@time -f"$*:doctest %e" make suite.compile.doctest
	@time -f"$*:doctest %e" ./a.out
	@ls -l a.out | cut -d' ' -f6 | xargs echo "$*:doctest"

	@make clean
	@for ((v=0; v<$(N); ++v)); do (echo '<% n=$(N); v=' $$v '%>' && cat ut/$*.erb) | erb > ut_suite_$$v.cpp; done
	@time -f"$*:ut %e" make suite.compile.ut
	@time -f"$*:ut %e" ./a.out
	@ls -l a.out | cut -d' ' -f6 | xargs echo "$*:ut"

suite.compile.googletest:
	@for ((v=0; v<$(N); ++v)); do $(CXX) $(CXXFLAGS) -I googletest/include -c googletest_suite_$$v.cpp; done; $(CXX) $(CXXFLAGS) -lpthread googletest/lib/libgtest_main.a googletest/lib/libgtest.a *.o

suite.compile.catch2:
	@for ((v=0; v<$(N); ++v)); do $(CXX) $(CXXFLAGS) -I catch2/include -c catch2_suite_$$v.cpp; done; $(CXX) $(CXXFLAGS) -I catch2/include catch2/main.cpp *.o

suite.compile.doctest:
	@for ((v=0; v<$(N); ++v)); do $(CXX) $(CXXFLAGS) -I doctest/include -c doctest_suite_$$v.cpp; done; $(CXX) $(CXXFLAGS) -I doctest/include doctest/main.cpp *.o

suite.compile.ut:
	@for ((v=0; v<$(N); ++v)); do $(CXX) $(CXXFLAGS) -I ut/include -c ut_suite_$$v.cpp; done; $(CXX) $(CXXFLAGS) -I ut/include ut/main.cpp *.o

suite.compile.ut.pch:
	@$(CXX) $(CXXFLAGS) -I ut/include ut/suite+assert+stl.pch.hpp -o suite+assert.stl.pch
	@for ((v=0; v<$(N); ++v)); do $(CXX) $(CXXFLAGS) -I . -c -include-pch suite+assert.stl.pch ut_suite_$$v.cpp; done; $(CXX) $(CXXFLAGS) -I ut/include ut/main.cpp *.o

suite.compile.ut.module:
	@$(CXX) $(CXXFLAGS) -I ut/include -D__cpp_modules -fmodules --precompile -x c++-module ut/include/boost/ut.hpp -o boost.ut.pcm
	@for ((v=0; v<$(N); ++v)); do $(CXX) $(CXXFLAGS) -I ut/include -c -D__cpp_modules -fmodules -fprebuilt-module-path=. ut_suite_$$v.cpp; done; $(CXX) $(CXXFLAGS) -I ut/include ut/main.cpp *.o

ut.suite+assert+stl.benchmark: ut.header.suite+assert+stl.benchmark ut.pch.suite+assert+stl.benchmark ut.module.suite+assert+stl.benchmark
	

ut.header.%.benchmark:
	@make clean
	@for ((v=0; v<$(N); ++v)); do (echo '<% n=$(N); v=' $$v '%>' && cat ut/$*.header.erb) | erb > ut_suite_$$v.cpp; done
	@time -f"$*:ut.header %e" make suite.compile.ut
	@time -f"$*:ut.header %e" ./a.out
	@ls -l a.out | cut -d' ' -f6 | xargs echo "$*:ut.header"

ut.pch.%.benchmark:
	@make clean
	@for ((v=0; v<$(N); ++v)); do (echo '<% n=$(N); v=' $$v '%>' && cat ut/$*.pch.erb) | erb > ut_suite_$$v.cpp; done
	@time -f"$*:ut.pch %e" make suite.compile.ut.pch
	@time -f"$*:ut.pch %e" ./a.out
	@ls -l a.out | cut -d' ' -f6 | xargs echo "$*:ut.pch"

ut.module.%.benchmark:
	@make clean
	@for ((v=0; v<$(N); ++v)); do (echo '<% n=$(N); v=' $$v '%>' && cat ut/$*.module.erb) | erb > ut_suite_$$v.cpp; done
	@time -f"$*:ut.module %e" make suite.compile.ut.module
	@time -f"$*:ut.module %e" ./a.out
	@ls -l a.out | cut -d' ' -f6 | xargs echo "$*:ut.module"

clean:
	@rm -f *.o *.out *.cpp *.pch *.pcm
