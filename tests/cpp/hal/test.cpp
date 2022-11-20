
#include "gtest/gtest.h"
#include "hal/HAL.h"

TEST(BasicTest, BasicTest) {
  EXPECT_EQ(HAL_RuntimeType::HAL_Mock, HAL_GetRuntimeType());
}