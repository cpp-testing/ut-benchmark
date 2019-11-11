#include <gtest/gtest.h>

TEST(Assert, Expect) {
	for (auto i = 0; i < 1'000'000; ++i) {
		EXPECT_EQ(i, i);
	}
}
