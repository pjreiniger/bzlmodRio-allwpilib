
#include <iostream>
#include <cameraserver/CameraServer.h>

int main() {
    
    std::cout << "Hello World" << std::endl;

    frc::CameraServer::GetInstance()->StartAutomaticCapture();
    return 0;
}