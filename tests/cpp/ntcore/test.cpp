
#include "gtest/gtest.h"
#include "networktables/NetworkTableValue.h"

TEST(BasicTest, BasicTest) {
  nt::Value v;
  ASSERT_EQ(NT_UNASSIGNED, v.type());
}