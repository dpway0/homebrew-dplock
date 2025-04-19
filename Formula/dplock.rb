class Dplock < Formula
  desc "Simple, secure CLI password manager written in Rust"
  homepage "https://github.com/dpway0/dplock"
  version "0.4.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dpway0/dplock/releases/download/v0.4.1/dplock-0.4.1-macos-arm64.tar.gz"
      sha256 "9be9663163c730734e88629dad25a75233945656b14ffb7cce1250b817d229bc"
    end

    if Hardware::CPU.intel?
      url "https://github.com/dpway0/dplock/releases/download/v0.4.1/dplock-0.4.1-macos-x86_64.tar.gz"
      sha256 "ea161acb55e2219ba245d3ad3aaa8bbae4c88a64ecd921623387b8991f90ed98"
    end
  end

  on_linux do
    url "https://github.com/dpway0/dplock/releases/download/v0.4.1/dplock-0.4.1-linux-x86_64.tar.gz"
    sha256 "8c028d33873b947bbc6784edd3bb72d809abe1762509bfefc51089a14d5866dd"
  end

  def install
    bin.install "dplock"
  end

  test do
    system "#{bin}/dplock", "--help"
  end
end

