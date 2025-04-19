class Dplock < Formula
  desc "Simple, secure CLI password manager written in Rust"
  homepage "https://github.com/dpway0/dplock"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dpway0/dplock/releases/download/v0.4.0/dplock-0.4.0-macos-arm64.tar.gz"
      sha256 "0afd336936bb417851570eb4f51fc90926a4bc9f21a7cb1526daa86f25e4eb16"
    end

    if Hardware::CPU.intel?
      url "https://github.com/dpway0/dplock/releases/download/v0.4.0/dplock-0.4.0-macos-x86_64.tar.gz"
      sha256 "5f1fccdfd910b1b483fcc1db8473d9317246d53a8972b73e901d21f612d3a28e"
    end
  end

  on_linux do
    url "https://github.com/dpway0/dplock/releases/download/v0.4.0/dplock-0.4.0-linux-x86_64.tar.gz"
    sha256 "4fa0b8d999ca2159caa56563d32e932e19f2511b7b07c755a38967fb3345f08d"
  end

  def install
    bin.install "dplock"
  end

  test do
    system "#{bin}/dplock", "--help"
  end
end

