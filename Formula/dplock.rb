class Dplock < Formula
  desc "Simple, secure CLI password manager written in Rust"
  homepage "https://github.com/dpway0/dplock"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dpway0/dplock/releases/download/v0.4.0/dplock-0.4.0-macos-arm64.tar.gz"
      sha256 "6d833ee16f290c1b88d5a27f7195aa038513ca6a6ca0766517c1397ddf5806f3"
    end

    if Hardware::CPU.intel?
      url "https://github.com/dpway0/dplock/releases/download/v0.4.0/dplock-0.4.0-macos-x86_64.tar.gz"
      sha256 "0242367b7a389db98467daab1232c66073e3c89cf1e4db8cee4bad2f392e77f3"
    end
  end

  on_linux do
    url "https://github.com/dpway0/dplock/releases/download/v0.4.0/dplock-0.4.0-linux-x86_64.tar.gz"
    sha256 "ebdf78cc0036cbfb1af61126983e3058281b3b94c3b9b4c00d1144d6b2f0ec0b"
  end

  def install
    bin.install "dplock"
  end

  test do
    system "#{bin}/dplock", "--help"
  end
end

