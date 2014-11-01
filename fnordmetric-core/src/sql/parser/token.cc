/**
 * This file is part of the "FnordMetric" project
 *   Copyright (c) 2014 Paul Asmuth, Google Inc.
 *
 * FnordMetric is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License v3.0. You should have received a
 * copy of the GNU General Public License along with this program. If not, see
 * <http://www.gnu.org/licenses/>.
 */
#include <fnordmetric/sql/parser/token.h>
#include <fnordmetric/util/runtimeexception.h>
#include <fnordmetric/util/stringutil.h>
#include <string.h>

namespace fnordmetric {
namespace query {

static char* copyTokenData(const char* data, size_t len) {
  if (data == nullptr) {
    return nullptr;
  }

  void* data_copy = malloc(len);
  if (data_copy == nullptr) {
    RAISE(kRuntimeError, "malloc() failed");
  }

  memcpy(data_copy, data, len);
  return static_cast<char *>(data_copy);
}

Token::Token(kTokenType token_type) :
    type_(token_type),
    data_(nullptr),
    len_(0) {}

Token::Token(
    kTokenType token_type,
    const char* data,
    size_t len) :
    type_(token_type),
    len_(len),
    data_(copyTokenData(data, len)) {}

Token::Token(const Token& copy) :
    type_(copy.type_),
    len_(copy.len_),
    data_(copyTokenData(copy.data_, copy.len_)) {}

Token::~Token() {
  if (data_ != nullptr) {
    free(data_);
  }
}

// FIXPAUL!!
void Token::debugPrint() const {
  if (len_ == 0) {
    printf("%s\n", getTypeName(type_));
  } else {
    char buf[1024];

    if (len_ >= sizeof(buf)) {
      RAISE(kRuntimeError, "token too large");
    }

    memcpy(buf, data_, len_);
    buf[len_] = 0;
    printf("%s(%s)\n", getTypeName(type_), buf);
  }
}

const char* Token::getTypeName(kTokenType type) {
  switch (type) {
    case T_SELECT:
      return "T_SELECT";

    case T_FROM:
      return "T_FROM";

    case T_WHERE:
      return "T_WHERE";

    case T_GROUP:
      return "T_GROUP";

    case T_BY:
      return "T_GROUP";

    case T_HAVING:
      return "T_HAVING";

    case T_AS:
      return "T_AS";

    case T_ASC:
      return "T_ASC";

    case T_DESC:
      return "T_DESC";

    case T_COMMA:
      return "T_COMMA";

    case T_DOT:
      return "T_DOT";

    case T_SEMICOLON:
      return "T_SEMICOLON";

    case T_LPAREN:
      return "T_LPAREN";

    case T_RPAREN:
      return "T_RPAREN";

    case T_EQUAL:
      return "T_EQUAL";

    case T_PLUS:
      return "T_PLUS";

    case T_MINUS:
      return "T_MINUS";

    case T_ASTERISK:
      return "T_ASTERISK";

    case T_NOT:
      return "T_NOT";

    case T_NUMERIC:
      return "T_NUMERIC";

    case T_IDENTIFIER:
      return "T_IDENTIFIER";

    default:
      return "T_UNKNOWN_TOKEN";
  }
}

Token::kTokenType Token::getType() const {
  return type_;
}

bool Token::operator==(const std::string& string) const {
  if (this->len_ != string.size()) {
    return false;
  }

  // FIXPAUL this might copy string just for a strncmp
  return strncasecmp(this->data_, string.c_str(), string.size()) == 0;
}

bool Token::operator==(kTokenType type) const {
  return type_ == type;
}

bool Token::operator==(const Token& other) const {
  if (type_ != other.type_) {
    return false;
  }

  if (len_ != other.len_) {
    return false;
  }

  if (len_ > 0) {
    return memcmp(data_, other.data_, len_) == 0;
  } else {
    return true;
  }
}

int64_t Token::getInteger() const {
  int64_t value = 0;

  for(int i = 0; i < len_; ++i) {
    value *= 10;
    value += data_[i] - '0';
  }

  return value;
}

const std::string Token::getString() const {
  if (len_ == 0) {
    return std::string();
  } else {
    return std::string(data_, len_);
  }
}

} // namespace query
} // namespace fnordmetric

template <>
std::string fnord::util::StringUtil::debugPrint<
    fnordmetric::query::Token::kTokenType>(
    const fnordmetric::query::Token::kTokenType& value) {
  return fnordmetric::query::Token::getTypeName(value);
}

template <>
std::string fnord::util::StringUtil::debugPrint<
    fnordmetric::query::Token>(
    const fnordmetric::query::Token& value) {
  return fnordmetric::query::Token::getTypeName(value.getType());
}