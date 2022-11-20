
#include <iostream>
#include <frc/ComputerVisionUtil.h>

int main() {
    std::cout << "Hello World" << std::endl;
    
  auto camHeight = 1_m;
  auto targetHeight = 3_m;
  auto camPitch = 0_deg;
  auto targetPitch = 30_deg;
  auto targetYaw = 0_deg;

  auto dist = frc::CalculateDistanceToTarget(camHeight, targetHeight, camPitch,
                                             targetPitch, targetYaw);
  std::cout << dist.value() << std::endl;

    return 0;
}