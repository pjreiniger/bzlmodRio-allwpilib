
#include <iostream>
#include "wpinet/UrlParser.h"
#include "wpinet/HttpUtil.h"

int main() {
    std::cout << "Hello World" << std::endl;

    wpi::HttpMultipartScanner scanner("foo");
    std::cout << scanner.Execute("abcdefg---\r\n--foo\r\n").empty() << std::endl;
    std::cout << scanner.IsDone() << std::endl;
    std::cout << scanner.GetSkipped().empty() << std::endl;

    return 0;
}