#!/usr/bin/env bash
# Fetch the latest version of the library
fetch() {
if [ -f "peglib.h" ]; then return; fi
URL="https://github.com/yhirose/cpp-peglib/raw/refs/heads/master/peglib.h"
FILE="peglib.h"

# Download the release
if [ ! -f "$FILE" ]; then
  echo "Downloading $FILE from $URL ..."
  curl -L "$URL" -o "$FILE"
  echo ""
fi
}


# Test the project
test() {
echo "Running 01-validate-utf8.c ..."
clang -I. -o 01.exe examples/01-validate-utf8.c  && ./01.exe && echo -e "\n"
echo "Running 02-utf8-length.c ..."
clang -I. -o 02.exe examples/02-utf8-length.c    && ./02.exe && echo -e "\n"
}


# Main script
if [[ "$1" == "test" ]]; then test
elif [[ "$1" == "fetch" ]]; then fetch
else echo "Usage: $0 {fetch|test}"; fi
