.SILENT:
N?=100
I?=42
TIME=perf stat --metric-only ./a.out 2>&1 | grep seconds | cut -d' ' -f8 | xargs echo

all: include.benchmark assert.benchmark test.benchmark suite.benchmark suite+assert.benchmark suite+assert+stl.benchmark
	@make clean

ut:	ut.suite+assert+stl.benchmark
	@make clean

%.benchmark: clean
	@time -f"$*:boost.test %e" $(CXX) $(CXXFLAGS) -I boost.test/include boost.test/$*.cpp boost.test/lib/libboost_unit_test_framework.a
	@$(TIME) $*:boost.test:
	@ls -l a.out | cut -d' ' -f6 | xargs echo "$*:boost.test"

	@time -f"$*:googletest %e" $(CXX) $(CXXFLAGS) -I googletest/include googletest/$*.cpp googletest/lib/libgtest_main.a googletest/lib/libgtest.a -lpthread
	@$(TIME) $*:googletest
	@ls -l a.out | cut -d' ' -f6 | xargs echo "$*:googletest"

	@time -f"$*:catch2 %e" $(CXX) $(CXXFLAGS) -I catch2/include catch2/$*.cpp
	@$(TIME) $*:catch2
	@ls -l a.out | cut -d' ' -f6 | xargs echo "$*:catch2"

	@time -f"$*:doctest %e" $(CXX) $(CXXFLAGS) -I doctest/include doctest/$*.cpp
	@$(TIME) $*:doctest
	@ls -l a.out | cut -d' ' -f6 | xargs echo "$*:doctest"

	@time -f"$*:ut %e" $(CXX) $(CXXFLAGS) -I ut/include ut/$*.cpp
	@$(TIME) $*:ut
	@ls -l a.out | cut -d' ' -f6 | xargs echo "$*:ut"

suite.benchmark suite+assert.benchmark suite+assert+stl.benchmark:
	@make $@.explicit

%.benchmark.explicit:
	@make clean
	@for ((v=0; v<$(N); ++v)); do (echo '<% n=$(N); v=' $$v '; match="pass"; %>' && cat boost.test/$*.erb) | erb > boost.test_suite_$$v.cpp; done
	@time -f"$*:boost.test %e" make suite.compile.boost.test
	@$(TIME) $*:boost.test
	@ls -l a.out | cut -d' ' -f6 | xargs echo "$*:boost.test"
	@make incremental.boost.test.$*.benchmark

	@make clean
	@for ((v=0; v<$(N); ++v)); do (echo '<% n=$(N); v=' $$v '; match="pass"; %>' && cat googletest/$*.erb) | erb > googletest_suite_$$v.cpp; done
	@time -f"$*:googletest %e" make suite.compile.googletest
	@$(TIME) $*:googletest
	@ls -l a.out | cut -d' ' -f6 | xargs echo "$*:googletest"
	@make incremental.googletest.$*.benchmark

	@make clean
	@for ((v=0; v<$(N); ++v)); do (echo '<% n=$(N); v=' $$v '; match="pass"; %>' && cat catch2/$*.erb) | erb > catch2_suite_$$v.cpp; done
	@time -f"$*:catch2 %e" make suite.compile.catch2
	@$(TIME) $*:catch2
	@ls -l a.out | cut -d' ' -f6 | xargs echo "$*:catch2"
	@make incremental.catch2.$*.benchmark

	@make clean
	@for ((v=0; v<$(N); ++v)); do (echo '<% n=$(N); v=' $$v '; match="pass"; %>' && cat doctest/$*.erb) | erb > doctest_suite_$$v.cpp; done
	@time -f"$*:doctest %e" make suite.compile.doctest
	@$(TIME) $*:doctest
	@ls -l a.out | cut -d' ' -f6 | xargs echo "$*:doctest"
	@make incremental.doctest.$*.benchmark

	@make clean
	@for ((v=0; v<$(N); ++v)); do (echo '<% n=$(N); v=' $$v '; match="pass"; %>' && cat ut/$*.erb) | erb > ut_suite_$$v.cpp; done
	@time -f"$*:ut %e" make suite.compile.ut
	@$(TIME) $*:ut
	@ls -l a.out | cut -d' ' -f6 | xargs echo "$*:ut"
	@make incremental.ut.$*.benchmark

incremental.%:
	

incremental.%.suite+assert+stl.benchmark:
	(echo '<% n=$(N); v=$(I); match="fail"; %>' && cat $*/suite+assert+stl.erb) | erb > $*_suite_$(I).cpp
	@time -f"incremental.suite+assert+stl:$* %e" make suite.compile.$*.$(I)
	@$(TIME) incremental.suite+assert+stl:$*
	@ls -l a.out | cut -d' ' -f6 | xargs echo "incremental.suite+assert+stl:$*"

suite.compile.boost.test:
	$(CXX) $(CXXFLAGS) -I boost.test/include -c boost.test/main.cpp 
	@for ((v=0; v<$(N); ++v)); do $(CXX) $(CXXFLAGS) -I boost.test/include -c boost.test_suite_$$v.cpp; done; $(CXX) $(CXXFLAGS) -I boost.test/include boost.test/lib/libboost_unit_test_framework.a *.o

suite.compile.boost.test.%:
	$(CXX) $(CXXFLAGS) -I boost.test/include -c boost.test_suite_$*.cpp
	$(CXX) $(CXXFLAGS) -I boost.test/include boost.test/lib/libboost_unit_test_framework.a *.o

suite.compile.googletest:
	@for ((v=0; v<$(N); ++v)); do $(CXX) $(CXXFLAGS) -I googletest/include -c googletest_suite_$$v.cpp; done; $(CXX) $(CXXFLAGS) -lpthread googletest/lib/libgtest_main.a googletest/lib/libgtest.a *.o

suite.compile.googletest.%:
	$(CXX) $(CXXFLAGS) -I googletest/include -c googletest_suite_$*.cpp
	$(CXX) $(CXXFLAGS) -lpthread googletest/lib/libgtest_main.a googletest/lib/libgtest.a *.o

suite.compile.catch2:
	$(CXX) $(CXXFLAGS) -I catch2/include -c catch2/main.cpp
	@for ((v=0; v<$(N); ++v)); do $(CXX) $(CXXFLAGS) -I catch2/include -c catch2_suite_$$v.cpp; done; $(CXX) $(CXXFLAGS) -I catch2/include *.o

suite.compile.catch2.%:
	$(CXX) $(CXXFLAGS) -I catch2/include -c catch2_suite_$*.cpp
	$(CXX) $(CXXFLAGS) -I catch2/include *.o

suite.compile.doctest:
	$(CXX) $(CXXFLAGS) -I doctest/include -c doctest/main.cpp
	@for ((v=0; v<$(N); ++v)); do $(CXX) $(CXXFLAGS) -I doctest/include -c doctest_suite_$$v.cpp; done; $(CXX) $(CXXFLAGS) -I doctest/include *.o

suite.compile.doctest.%:
	$(CXX) $(CXXFLAGS) -I doctest/include -c doctest_suite_$*.cpp
	$(CXX) $(CXXFLAGS) -I doctest/include *.o

suite.compile.ut:
	$(CXX) $(CXXFLAGS) -I ut/include -c ut/main.cpp
	@for ((v=0; v<$(N); ++v)); do $(CXX) $(CXXFLAGS) -I ut/include -c ut_suite_$$v.cpp; done; $(CXX) $(CXXFLAGS) -I ut/include *.o

suite.compile.ut.%:
	$(CXX) $(CXXFLAGS) -I ut/include -c ut_suite_$*.cpp
	$(CXX) $(CXXFLAGS) -I ut/include *.o

suite.compile.ut.pch:
	@$(CXX) $(CXXFLAGS) -I ut/include ut/suite+assert+stl.pch.hpp -o suite+assert.stl.pch
	@for ((v=0; v<$(N); ++v)); do $(CXX) $(CXXFLAGS) -I . -c -include-pch suite+assert.stl.pch ut_suite_$$v.cpp; done; $(CXX) $(CXXFLAGS) -I ut/include ut/main.cpp *.o

suite.compile.ut.module:
	@$(CXX) $(CXXFLAGS) -I ut/include -D__cpp_modules -fmodules --precompile -x c++-module ut/include/boost/ut.hpp -o boost.ut.pcm
	@for ((v=0; v<$(N); ++v)); do $(CXX) $(CXXFLAGS) -I ut/include -c -D__cpp_modules -fmodules -fprebuilt-module-path=. ut_suite_$$v.cpp; done; $(CXX) $(CXXFLAGS) -I ut/include ut/main.cpp *.o

ut.suite+assert+stl.benchmark: ut.header.suite+assert+stl.benchmark ut.pch.suite+assert+stl.benchmark ut.module.suite+assert+stl.benchmark
	

ut.header.%.benchmark:
	@make clean
	@for ((v=0; v<$(N); ++v)); do (echo '<% n=$(N); v=' $$v '; match="pass"; %>' && cat ut/$*.header.erb) | erb > ut_suite_$$v.cpp; done
	@time -f"$*:ut.header %e" make suite.compile.ut
	@$(TIME) $*:ut.header
	@ls -l a.out | cut -d' ' -f6 | xargs echo "$*:ut.header"

ut.pch.%.benchmark:
	@make clean
	@for ((v=0; v<$(N); ++v)); do (echo '<% n=$(N); v=' $$v '; match="pass"; %>' && cat ut/$*.pch.erb) | erb > ut_suite_$$v.cpp; done
	@time -f"$*:ut.pch %e" make suite.compile.ut.pch
	@$(TIME) $*:ut.pch
	@ls -l a.out | cut -d' ' -f6 | xargs echo "$*:ut.pch"

ut.module.%.benchmark:
	@make clean
	@for ((v=0; v<$(N); ++v)); do (echo '<% n=$(N); v=' $$v '; match="pass"; %>' && cat ut/$*.module.erb) | erb > ut_suite_$$v.cpp; done
	@time -f"$*:ut.module %e" make suite.compile.ut.module
	@$(TIME) $*:ut.module
	@ls -l a.out | cut -d' ' -f6 | xargs echo "$*:ut.module"

clean:
	@rm -f *.o *.out *.cpp *.pch *.pcm
