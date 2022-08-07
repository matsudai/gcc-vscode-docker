#include "separated_values_field.hpp"

SeparatedValuesField::SeparatedValuesField(const std::string& text,
                                           const std::regex& delim) {
  init(text, delim);
}

void SeparatedValuesField::init(const std::string& text,
                                const std::regex& delim) {
  _text = text;
  _delim = delim;
  _values = {};
  parse();
}

const std::vector<std::string>& SeparatedValuesField::parse() {
  std::sregex_token_iterator beg{_text.begin(), _text.end(), _delim, -1};
  std::sregex_token_iterator end{};

  _values = std::vector<std::string>{beg, end};

  return _values;
}

const std::vector<std::string>& SeparatedValuesField::values() const {
  return _values;
}
