#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#include <doctest.h>

TEST_CASE("Check") {
	for (auto i = 0; i < 1'000'000; ++i) {
		CHECK(i == i);
	}
}
