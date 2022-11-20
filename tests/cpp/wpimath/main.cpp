
#include <iostream>
#include <units/length.h>

int main() {
    std::cout << "Hello World" << std::endl;
    
  auto camHeight = 1_m;

  std::cout << camHeight.value() << std::endl;

    return 0;
}