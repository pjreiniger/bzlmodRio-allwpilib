
#include "gtest/gtest.h"
#include "frc/geometry/Pose2d.h"

TEST(BasicTest, BasicTest) {
  const frc::Pose2d initial{1_m, 2_m, 45_deg};
  const frc::Transform2d transform{frc::Translation2d{5_m, 0_m}, 5_deg};

  const auto transformed = initial + transform;

  EXPECT_DOUBLE_EQ(1.0 + 5.0 / std::sqrt(2.0), transformed.X().value());
  EXPECT_DOUBLE_EQ(2.0 + 5.0 / std::sqrt(2.0), transformed.Y().value());
  EXPECT_DOUBLE_EQ(50.0, transformed.Rotation().Degrees().value());
}