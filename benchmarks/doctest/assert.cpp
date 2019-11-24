#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#define DOCTEST_CONFIG_SUPER_FAST_ASSERTS
#include <doctest.h>

TEST_CASE("Assert") {
	for (auto i = 0; i < 1'000'000; ++i) {
		CHECK(i == i);
	}
}
