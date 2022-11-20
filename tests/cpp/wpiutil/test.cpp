

#include "wpi/circular_buffer.h"

#include <array>

#include "gtest/gtest.h"

static const std::array<double, 10> values = {
    {751.848, 766.366, 342.657, 234.252, 716.126, 132.344, 445.697, 22.727,
     421.125, 799.913}};

static const std::array<double, 8> pushFrontOut = {
    {799.913, 421.125, 22.727, 445.697, 132.344, 716.126, 234.252, 342.657}};

TEST(BasicTest, BasicTest) {
  wpi::circular_buffer<double> queue(8);

  for (auto& value : values) {
    queue.push_front(value);
  }

  for (size_t i = 0; i < pushFrontOut.size(); ++i) {
    EXPECT_EQ(pushFrontOut[i], queue[i]);
  }
}