#define BOOST_TEST_MODULE ASSERT
#include <boost/test/unit_test.hpp>

BOOST_AUTO_TEST_CASE(assert) {
	for (auto i = 0; i < 1'000'000; ++i) {
		BOOST_TEST(i == i);
	}
}
