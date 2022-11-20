
#include <iostream>
#include <networktables/NetworkTable.h>

int main() {
    std::cout << "Hello World" << std::endl;
    
  // set up instances
  auto client = nt::CreateInstance();
  auto server = nt::CreateInstance();
    
  nt::StartServer(server, "bench.json", "127.0.0.1", 0, 10000);
  nt::StartClient4(client, "client");
  nt::SetServer(client, "127.0.0.1", 10000);
    std::cout << "Hello World" << std::endl;

    return 0;
}