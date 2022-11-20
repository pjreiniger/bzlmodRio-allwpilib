
#include <iostream>
#include <frc/TimedRobot.h>
#include "cameraserver/CameraServer.h"

class Robot : public frc::TimedRobot {
public:
  void RobotInit() override {
    frc::CameraServer::GetInstance()->StartAutomaticCapture();
  }
   
  void RobotPeriodic() override {
    std::cout << "Hello world" << std::endl;
  }

};

#ifndef RUNNING_FRC_TESTS
int main() { return frc::StartRobot<Robot>(); }
#endif
