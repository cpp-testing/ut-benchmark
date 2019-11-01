#define CATCH_CONFIG_MAIN
#include "catch.hpp"

TEST_CASE("require") {
	for (auto i = 0; i < 1'000'000; ++i) {
		REQUIRE(i == i);
	}
}
