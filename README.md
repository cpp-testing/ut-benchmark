# Unit Testing Frameworks - Benchmarks

* **Frameworks**

  * [googletest-1.10.0](https://github.com/google/googletest/releases/tag/release-1.10.0)
  * [catch-2.10.2](https://github.com/catchorg/Catch2/releases/download/v2.10.2/catch.hpp)
    * `CATCH_CONFIG_FAST_COMPILE`
  * [doctest-2.3.5](https://github.com/onqtam/doctest/blob/master/doctest/doctest.h)
    * `DOCTEST_CONFIG_SUPER_FAST_ASSERTS, `
  * [μt-1.1.0](https://github.com/boost-experimental/ut/blob/master/include/boost/ut.hpp)

* **Benchmarks**

  | Test    | Description |
  | ------- | ----- |
  | [include](benchmarks)        | `0 tests, 0 asserts, 1 cpp file`              |
  | [assert](benchmarks)         | `1 test, 1'000'000 asserts, 1 cpp file`       |
  | [test](benchmarks)           | `1'000 tests, 0 asserts, 1 cpp file`          |
  | [suite](benchmarks)          | `10'000 tests, 0 asserts, 100 cpp files`      |
  | [suite+assert](benchmarks)   | `10'000 tests, 20'200 asserts, 100 cpp files` |

* **Results**

  ![](results/Compilation_include_clang9.debug.png)
  ![](results/Compilation_include_clang9.O2.png)
  ![](results/Compilation_include_clang9.png)
  ![](results/Compilation_include_gcc9.debug.png)
  ![](results/Compilation_include_gcc9.O2.png)
  ![](results/Compilation_include_gcc9.png)

  ![](results/Compilation_assert_clang9.debug.png)
  ![](results/Compilation_assert_clang9.O2.png)
  ![](results/Compilation_assert_clang9.png)
  ![](results/Compilation_assert_gcc9.debug.png)
  ![](results/Compilation_assert_gcc9.O2.png)
  ![](results/Compilation_assert_gcc9.png)
  ![](results/Execution_assert_clang9.debug.png)
  ![](results/Execution_assert_clang9.O2.png)
  ![](results/Execution_assert_clang9.png)
  ![](results/Execution_assert_gcc9.debug.png)
  ![](results/Execution_assert_gcc9.O2.png)
  ![](results/Execution_assert_gcc9.png)

  ![](results/Compilation_test_clang9.debug.png)
  ![](results/Compilation_test_clang9.O2.png)
  ![](results/Compilation_test_clang9.png)
  ![](results/Compilation_test_gcc9.debug.png)
  ![](results/Compilation_test_gcc9.O2.png)
  ![](results/Compilation_test_gcc9.png)
  ![](results/Execution_test_clang9.debug.png)
  ![](results/Execution_test_clang9.O2.png)
  ![](results/Execution_test_clang9.png)
  ![](results/Execution_test_gcc9.debug.png)
  ![](results/Execution_test_gcc9.O2.png)
  ![](results/Execution_test_gcc9.png)

  ![](results/Compilation_suite_clang9.debug.png)
  ![](results/Compilation_suite_clang9.O2.png)
  ![](results/Compilation_suite_clang9.png)
  ![](results/Compilation_suite_gcc9.debug.png)
  ![](results/Compilation_suite_gcc9.O2.png)
  ![](results/Compilation_suite_gcc9.png)
  ![](results/Execution_suite_clang9.debug.png)
  ![](results/Execution_suite_clang9.O2.png)
  ![](results/Execution_suite_clang9.png)
  ![](results/Execution_suite_gcc9.debug.png)
  ![](results/Execution_suite_gcc9.O2.png)
  ![](results/Execution_suite_gcc9.png)

  ![](results/Compilation_suite+assert_clang9.debug.png)
  ![](results/Compilation_suite+assert_clang9.O2.png)
  ![](results/Compilation_suite+assert_clang9.png)
  ![](results/Compilation_suite+assert_gcc9.debug.png)
  ![](results/Compilation_suite+assert_gcc9.O2.png)
  ![](results/Compilation_suite+assert_gcc9.png)
  ![](results/Execution_suite+assert_clang9.debug.png)
  ![](results/Execution_suite+assert_clang9.O2.png)
  ![](results/Execution_suite+assert_clang9.png)
  ![](results/Execution_suite+assert_gcc9.debug.png)
  ![](results/Execution_suite+assert_gcc9.O2.png)
  ![](results/Execution_suite+assert_gcc9.png)
