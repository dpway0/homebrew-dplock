class Dplock < Formula
  desc "Simple, secure CLI password manager written in Rust"
  homepage "https://github.com/dpway0/dplock"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dpway0/dplock/releases/download/v0.4.0/dplock-0.4.0-macos-arm64.tar.gz"
      sha256 "70d357efc7cd6aaad439f79b64e178806e1c68af5b952704ada1e4c466652690"
    end

    if Hardware::CPU.intel?
      url "https://github.com/dpway0/dplock/releases/download/v0.4.0/dplock-0.4.0-macos-x86_64.tar.gz"
      sha256 "0242367b7a389db98467daab1232c66073e3c89cf1e4db8cee4bad2f392e77f3"
    end
  end

  on_linux do
    url "https://github.com/dpway0/dplock/releases/download/v0.4.0/dplock-0.4.0-linux-x86_64.tar.gz"
    sha256 "63c22b72295bdd98322d04b78597432799c0aafb90b39d9e77b19047cd5b882c"
  end

  def install
    bin.install "dplock"
  end

  test do
    system "#{bin}/dplock", "--help"
  end
end

