class Dplock < Formula
  desc "Simple, secure CLI password manager written in Rust"
  homepage "https://github.com/dpway0/dplock"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dpway0/dplock/releases/download/v0.5.0/dplock-0.5.0-macos-arm64.tar.gz"
      sha256 "7b64fa356ca61c2cee0e0905fd3bece841d1587524fc09b6a5b914336278277e"
    end

    if Hardware::CPU.intel?
      url "https://github.com/dpway0/dplock/releases/download/v0.5.0/dplock-0.5.0-macos-x86_64.tar.gz"
      sha256 "f5869ff5539745df6587aa9556e185f3342270ddb4ce26d2943750111bb7f805"
    end
  end

  on_linux do
    url "https://github.com/dpway0/dplock/releases/download/v0.5.0/dplock-0.5.0-linux-x86_64.tar.gz"
    sha256 "405528bceb5bc8cd60e98e795597028589d605c4811a6140beb6301dfed67a68"
  end

  def install
    bin.install "dplock"
  end

  test do
    system "#{bin}/dplock", "--help"
  end
end

