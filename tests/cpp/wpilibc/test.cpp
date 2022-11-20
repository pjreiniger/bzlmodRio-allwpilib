
#include "frc/simulation/BuiltInAccelerometerSim.h"

#include <hal/Accelerometer.h>
#include <hal/HALBase.h>

#include "gtest/gtest.h"

TEST(BasicTest, BasicTest) {
  HAL_Initialize(500, 0);

  frc::sim::BuiltInAccelerometerSim sim;

  sim.ResetData();

  bool wasTriggered = false;
  bool lastValue = false;

  auto cb = sim.RegisterActiveCallback(
      [&](wpi::StringRef name, const HAL_Value* value) {
        wasTriggered = true;
        lastValue = value->data.v_boolean;
      },
      false);

  EXPECT_FALSE(wasTriggered);

  HAL_SetAccelerometerActive(true);

  EXPECT_TRUE(wasTriggered);
  EXPECT_TRUE(lastValue);
}