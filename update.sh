#!/usr/bin/env bash

set -e

# Paths
CARGO_TOML="../dplock/Cargo.toml"
DIST_DIR="../dplock/dists"
FORMULA_FILE="Formula/dplock.rb"

# Get version from Cargo.toml
VERSION=$(awk -F\" '/^version =/ {print $2}' "$CARGO_TOML")
if [ -z "$VERSION" ]; then
    echo "❌ Could not extract version from Cargo.toml!"
    exit 1
fi

# Replace version in Formula
sed -i.bak "s/^  version \".*\"/  version \"$VERSION\"/" "$FORMULA_FILE"

# Platforms
PLATFORMS=("macos-arm64" "macos-x86_64" "linux-x86_64")

for platform in "${PLATFORMS[@]}"; do
    file="$DIST_DIR/dplock-${VERSION}-${platform}.tar.gz"

    if [[ ! -f "$file" ]]; then
        echo "⚠️  File not found: $file"
        continue
    fi

    sha256=$(shasum -a 256 "$file" | awk '{print $1}')
    url="https://github.com/dpway0/dplock/releases/download/v${VERSION}/dplock-${VERSION}-${platform}.tar.gz"

    case "$platform" in
        macos-arm64)
            # Update URL (old style)
            sed -i.bak "/url \".*macos-arm64.tar.gz\"/s|url \".*\"|url \"$url\"|" "$FORMULA_FILE"
            # Update SHA (new style — scoped inside block)
            sed -i.bak "/if Hardware::CPU.arm?/,/end/{
                /sha256 \".*\"/s|sha256 \".*\"|sha256 \"$sha256\"|
            }" "$FORMULA_FILE"
            ;;
        macos-x86_64)
            sed -i.bak "/url \".*macos-x86_64.tar.gz\"/s|url \".*\"|url \"$url\"|" "$FORMULA_FILE"
            sed -i.bak "/if Hardware::CPU.intel?/,/end/{
                /sha256 \".*\"/s|sha256 \".*\"|sha256 \"$sha256\"|
            }" "$FORMULA_FILE"
            ;;
        linux-x86_64)
            sed -i.bak "/url \".*linux-x86_64.tar.gz\"/s|url \".*\"|url \"$url\"|" "$FORMULA_FILE"
            sed -i.bak "/on_linux/,/end/{
                /sha256 \".*\"/s|sha256 \".*\"|sha256 \"$sha256\"|
            }" "$FORMULA_FILE"
            ;;
    esac

    echo "✅ Updated $platform: url + sha256 = $sha256"
done

rm -f "${FORMULA_FILE}.bak"

echo "🎉 Formula updated to version $VERSION!"
