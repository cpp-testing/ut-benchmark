#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#include "doctest.h"

TEST_CASE("check") {
	for (auto i = 0; i < 1'000'000; ++i) {
		CHECK(i == i);
	}
}
