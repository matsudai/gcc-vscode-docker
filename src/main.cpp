#include <iostream>
#include <regex>
#include <string>

#include "lib/separated_values_field.hpp"

int main() {
  SeparatedValuesField field{std::string{"aaa,,"}, std::regex{",|$"}};
  for (const auto &value : field.values()) {
    std::cout << '"' << value << '"' << std::endl;
  }
  return 0;
}
