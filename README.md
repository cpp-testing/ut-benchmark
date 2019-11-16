# Benchmarks - Unit Testing Frameworks

| Framework | Version | Standard | License | Linkage | Test configuration |
|-|-|-|-|-|-|
| **[GoogleTest](https://github.com/google/googletest)** | [1.10.0](https://github.com/google/googletest/releases/tag/release-1.10.0) | C++11 | BSD-3 | library | `static library` |
| **[Catch](https://github.com/catchorg/Catch2)** | [2.10.2](https://github.com/catchorg/Catch2/releases/download/v2.10.2/catch.hpp) | C++11 | Boost 1.0 | single header | `CATCH_CONFIG_FAST_COMPILE` |
| **[Doctest](https://github.com/onqtam/doctest)** | [2.3.5](https://github.com/onqtam/doctest/blob/master/doctest/doctest.h) | C++11 | MIT | single header | `DOCTEST_CONFIG_SUPER_FAST_ASSERTS` |
| **[μt](https://github.com/boost-experimental/ut)** | [1.1.0](https://github.com/boost-experimental/ut/blob/master/include/boost/ut.hpp) | C++20 | Boost 1.0 | single header/module | |

<table>
  <tr>
    <td colspan="3" align="center">
    <a href="https://github.com/cpp-testing/ut-benchmark/tree/master/benchmarks"><b>Include</b></a> / <i>0 tests, 0 asserts, 1 cpp file</i>
    </td>
  </tr>
  <tr>
    <td colspan="3" align="center"><a href="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/Compilation_include.png"><img src="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/Compilation_include.png"></a></td>
    <td></td>
  </tr>

  <tr>
    <td colspan="3" align="center">
    <a href="https://github.com/cpp-testing/ut-benchmark/tree/master/benchmarks"><b>Assert</b></a> / <i>1 test, 1'000'000 asserts, 1 cpp file</i>
    </td>
  </tr>
  <tr>
    <td><a href="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/Compilation_assert.png"><img src="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/Compilation_assert.png"></a></td>
    <td><a href="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/Execution_assert.png"><img src="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/Execution_assert.png"></a></td>
    <td><a href="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/BinarySize_assert.png"><img src="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/BinarySize_assert.png"></a></td>
  </tr>

  <tr>
    <td colspan="3" align="center">
    <a href="https://github.com/cpp-testing/ut-benchmark/tree/master/benchmarks"><b>Test</b></a> / <i>1'000 tests, 0 asserts, 1 cpp file</i>
    </td>
  </tr>
  <tr>
    <td><a href="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/Compilation_test.png"><img src="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/Compilation_test.png"></a></td>
    <td><a href="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/Execution_test.png"><img src="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/Execution_test.png"></a></td>
    <td><a href="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/BinarySize_test.png"><img src="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/BinarySize_test.png"></a></td>
  </tr>

  <tr>
    <td colspan="3" align="center">
    <a href="https://github.com/cpp-testing/ut-benchmark/tree/master/benchmarks"><b>Suite</b></a> / <i>10'000 tests, 0 asserts, 100 cpp files</i>
    </td>
  </tr>
  <tr>
    <td><a href="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/Compilation_suite.png"><img src="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/Compilation_suite.png"></a></td>
    <td><a href="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/Execution_suite.png"><img src="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/Execution_suite.png"></a></td>
    <td><a href="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/BinarySize_suite.png"><img src="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/BinarySize_suite.png"></a></td>
  </tr>

  <tr>
    <td colspan="3" align="center">
    <a href="https://github.com/cpp-testing/ut-benchmark/tree/master/benchmarks"><b>Suite+Assert</b></a> / <i>10'000 tests, 40'000 asserts, 100 cpp files</i>
    </td>
  </tr>
  <tr>
    <td><a href="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/Compilation_suite+assert.png"><img src="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/Compilation_suite+assert.png"></a></td>
    <td><a href="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/Execution_suite+assert.png"><img src="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/Execution_suite+assert.png"></a></td>
    <td><a href="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/BinarySize_suite+assert.png"><img src="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/BinarySize_suite+assert.png"></a></td>
  </tr>

  <tr>
    <td colspan="3" align="center">
    <a href="https://github.com/cpp-testing/ut-benchmark/tree/master/benchmarks"><b>Suite+Assert+STL</b></a> / <i>10'000 tests, 20'000 asserts, 100 cpp files</i>
    </td>
  </tr>
  <tr>
    <td><a href="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/Compilation_suite+assert+stl.png"><img src="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/Compilation_suite+assert+stl.png"></a></td>
    <td><a href="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/Execution_suite+assert+stl.png"><img src="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/Execution_suite+assert+stl.png"></a></td>
    <td><a href="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/BinarySize_suite+assert+stl.png"><img src="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/BinarySize_suite+assert+stl.png"></a></td>
  </tr>

  <tr>
    <td colspan="3" align="center">
    <a href="https://github.com/cpp-testing/ut-benchmark/tree/master/benchmarks"><b>Suite+Assert+STL</b></a> / <i>10'000 tests, 20'000 asserts, 100 cpp files<br/>(Headers vs Precompiled headers vs C++20 Modules)</i>
    </td>
  </tr>
  <tr>
    <td><a href="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/ut_Compilation_suite+assert+stl.png"><img src="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/ut_Compilation_suite+assert+stl.png"></a></td>
    <td><a href="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/ut_Execution_suite+assert+stl.png"><img src="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/ut_Execution_suite+assert+stl.png"></a></td>
    <td><a href="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/ut_BinarySize_suite+assert+stl.png"><img src="https://raw.githubusercontent.com/cpp-testing/ut-benchmark/master/results/ut_BinarySize_suite+assert+stl.png"></a></td>
  </tr>
</table>

---

#### To run benchmarks

```
cd benchmarks && ./bench.sh
```
