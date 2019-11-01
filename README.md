### Results

* `compile-time` / `run-time` (smaller is better)

| **Clang-9** | [μt-1.0.0](https://github.com/boost-experimental/ut/blob/master/include/boost/ut.hpp) | [doctest-2.3.5](https://github.com/onqtam/doctest/blob/master/doctest/doctest.h) | [catch-2.10.2](https://github.com/catchorg/Catch2/releases/download/v2.10.2/catch.hpp) |
| ------- | ----- | ----- | ----- |
| [include](https://github.com/cpp-testing/ut-benchmark) | 0.42s / -     | 1.29s / -     | 5.44s / -     |
| [assert](https://github.com/cpp-testing/ut-benchmark)  | 0.48s / 0.04s | 1.30s / 0.11s | 5.23s / 0.12s |
| [test](https://github.com/cpp-testing/ut-benchmark)    | 0.93s / 0.00s | 2.33s / 0.01s | 6.11s / 0.04s |
|                                                        |               |               |               |
| **GCC-9**   |                                          |               |               |               |
| [include](https://github.com/cpp-testing/ut-benchmark) | 0.50s / -     | 1.77s / -     | 8.83s / -     |
| [assert](https://github.com/cpp-testing/ut-benchmark)  | 0.59s / 0.05s | 1.73s / 0.13s | 8.71s / 0.14s |
| [test](https://github.com/cpp-testing/ut-benchmark)    | 1.49s / 0.00s | 2.41s / 0.01s | 9.79s / 0.02s |
