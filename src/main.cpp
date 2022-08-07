#include <iostream>

#include "lib/sample.hpp"

int main() {
  Sample value{};
  std::cout << value.to_s() << std::endl;
  return 0;
}
