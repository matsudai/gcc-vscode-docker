#ifndef SAMPLE_HPP
#define SAMPLE_HPP

#include <string>

class Sample {
public:
  Sample() = default;
  Sample(const Sample&) = default;
  Sample& operator=(const Sample&) = default;
  Sample(Sample&&) = default;
  Sample& operator=(Sample&&) = default;
  virtual ~Sample() = default;

  const std::string to_s() const;
};

#endif
