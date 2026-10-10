#!/bin/sh
set -eu
DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
JAR="$DIR/gradle-wrapper.jar"
URL="https://raw.githubusercontent.com/gradle/gradle/v9.2.1/gradle/wrapper/gradle-wrapper.jar"
EXPECTED="423cb469ccc0ecc31f0e4e1c309976198ccb734cdcbb7029d4bda0f18f57e8d9"

verify() {
  if command -v sha256sum >/dev/null 2>&1; then
    ACTUAL="$(sha256sum "$JAR" | awk '{print $1}')"
  elif command -v shasum >/dev/null 2>&1; then
    ACTUAL="$(shasum -a 256 "$JAR" | awk '{print $1}')"
  else
    echo "sha256sum or shasum is required." >&2
    exit 1
  fi
  [ "$ACTUAL" = "$EXPECTED" ] || { rm -f "$JAR"; echo "Gradle wrapper checksum mismatch." >&2; exit 1; }
}

[ -f "$JAR" ] && { verify; exit 0; }
TMP="$JAR.tmp"
rm -f "$TMP"
if command -v curl >/dev/null 2>&1; then
  curl -fL --retry 3 "$URL" -o "$TMP"
elif command -v wget >/dev/null 2>&1; then
  wget -O "$TMP" "$URL"
else
  echo "curl or wget is required." >&2
  exit 1
fi
mv "$TMP" "$JAR"
verify
echo "Gradle wrapper 9.2.1 bootstrapped and verified."
