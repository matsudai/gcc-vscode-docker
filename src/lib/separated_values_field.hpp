#ifndef SEPARATED_VALUES_FIELD_HPP
#define SEPARATED_VALUES_FIELD_HPP

#include <regex>
#include <string>
#include <vector>

class SeparatedValuesField {
private:
  std::string _text;
  std::regex _delim;
  std::vector<std::string> _values;

public:
  SeparatedValuesField(const std::string& text, const std::regex& delim);

  SeparatedValuesField() = delete;
  SeparatedValuesField(const SeparatedValuesField&) = default;
  SeparatedValuesField& operator=(const SeparatedValuesField&) = default;
  SeparatedValuesField(SeparatedValuesField&&) = default;
  SeparatedValuesField& operator=(SeparatedValuesField&&) = default;
  virtual ~SeparatedValuesField() = default;

  void init(const std::string& text, const std::regex& delim);
  const std::vector<std::string>& parse();
  const std::vector<std::string>& values() const;
};

#endif
