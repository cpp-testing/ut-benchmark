#define CATCH_CONFIG_FAST_COMPILE
#define CATCH_CONFIG_MAIN
#include <catch.hpp>

TEST_CASE("Assert") {
	for (auto i = 0; i < 1'000'000; ++i) {
		CHECK(i == i);
	}
}
