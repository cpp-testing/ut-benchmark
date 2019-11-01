### Benchmarks

| **Clang-9** | [doctest-2.3.5](https://github.com/onqtam/doctest/blob/master/doctest/doctest.h) | [μt-1.0.0](https://github.com/boost-experimental/ut/blob/master/include/boost/ut.hpp) |[catch-2.10.2](https://github.com/catchorg/Catch2/releases/download/v2.10.2/catch.hpp) |
| ------- | ----- | ----- | ----- |
| [include](https://github.com/cpp-testing/ut-benchmark) | 1.29s | 0.42s | 5.44s |
| [assert](https://github.com/cpp-testing/ut-benchmark)  | 1.30s | 0.48s | 5.23s |
| [test](https://github.com/cpp-testing/ut-benchmark)    | 2.33s | 0.93s | 6.11s |
|                                                        |       |       |       |
| **GCC-9**   |                                              |       |       |       |
| [include](https://github.com/cpp-testing/ut-benchmark) | 1.77s | 0.50s | 8.83s |
| [assert](https://github.com/cpp-testing/ut-benchmark)  | 1.73s | 0.59s | 8.71s |
| [test](https://github.com/cpp-testing/ut-benchmark)    | 2.41s | 1.49s | 9.79s |
