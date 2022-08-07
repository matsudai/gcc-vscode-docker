#include <string>
#include <vector>

#include "../../src/lib/separated_values_field.hpp"
#include "gmock/gmock.h"
#include "gtest/gtest.h"

auto exec_parse(std::string text, std::string delim = ",|$") {
  return SeparatedValuesField{text, std::regex{delim}}.values();
}

using namespace ::testing;

namespace {
  TEST(SeparatedValuesField, values) {
    EXPECT_THAT(exec_parse(""), ElementsAre(""));
    EXPECT_THAT(exec_parse("aaa"), ElementsAre("aaa"));
    EXPECT_THAT(exec_parse("aaa,bbb,ccc"), ElementsAre("aaa", "bbb", "ccc"));
    EXPECT_THAT(exec_parse(","), ElementsAre("", ""));
    EXPECT_THAT(exec_parse("aaa,"), ElementsAre("aaa", ""));
    EXPECT_THAT(exec_parse("aaa,,"), ElementsAre("aaa", "", ""));
  }
}  // namespace
