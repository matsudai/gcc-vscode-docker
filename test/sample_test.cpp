
#include "../src/lib/sample.hpp"

#include <string>

#include "gtest/gtest.h"

namespace MyLib {
  TEST(Sample, to_s) { EXPECT_EQ(std::string{"hogehoge"}, Sample{}.to_s()); }
}  // namespace MyLib
