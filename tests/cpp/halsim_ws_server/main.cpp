
#include <iostream>
#include <wpi/raw_ostream.h>
#include <wpi/json.h>
#include <hal/HAL.h>

int main() {
    wpi::json xxx = "{}"_json;
    std::string output;
    wpi::raw_string_ostream stream(output);
    xxx.dump(stream);
    std::cout << "Hello World" << std::endl;
    std::cout << output << std::endl;
    HAL_Initialize(500, 0);
    std::cout << output << std::endl;
    return 0;
}