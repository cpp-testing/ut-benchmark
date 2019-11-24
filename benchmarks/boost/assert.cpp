#define BOOST_TEST_MODULE AssertModule
#include <boost/test/unit_test.hpp>

BOOST_AUTO_TEST_CASE("Assert") {
	for (auto i = 0; i < 1'000'000; ++i) {
		BOOST_CHECK(i == i);
	}
}
