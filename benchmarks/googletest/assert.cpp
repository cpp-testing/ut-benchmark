#include <gtest/gtest.h>

TEST(Assert, Test) {
	for (auto i = 0; i < 1'000'000; ++i) {
		EXPECT_EQ(i, i);
	}
}
