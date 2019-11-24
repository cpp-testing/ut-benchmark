#include <boost/ut.hpp>

int main() {
  using namespace boost::ut;

  "assert"_test = [] {
    for (auto i = 0; i < 1'000'000; ++i) {
      expect(i == _i(i));
    }
  };
}
