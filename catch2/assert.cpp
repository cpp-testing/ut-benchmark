#define CATCH_CONFIG_MAIN
#include <catch.hpp>

TEST_CASE("Require") {
	for (auto i = 0; i < 1'000'000; ++i) {
		REQUIRE(i == i);
	}
}
