
#include <iostream>
#include <cameraserver/CameraServer.h>

int main() {
    
    std::cout << "Hello World" << std::endl;

    frc::CameraServer::StartAutomaticCapture();
    return 0;
}