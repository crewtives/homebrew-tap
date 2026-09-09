class Janus < Formula
  desc "Personal historian for makers — synthesizes git + Claude Code sessions into Obsidian"
  homepage "https://github.com/crewtives/janus"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-macos-arm64"
      sha256 "846290617b6a725dcd8139d2e0b0ba9cce142b57ad5af8c1fb61d4707896d3bb"
    end
    on_intel do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-macos-x64"
      sha256 "fdc1689e792eb7991beceba1f3cbea96f85d1ef659965b188c078f72c219c951"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-linux-arm64"
      sha256 "0de8baea3a118e7417c058882cdc41cbea075607ec9cc772a5fb4f2128d53427"
    end
    on_intel do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-linux-x64"
      sha256 "4e88a2c70494cdf3ae9fab63b6d268fae91ca91fede67d01ec8baa6f793571bd"
    end
  end

  def install
    asset = "janus-#{OS.mac? ? "macos" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "x64"}"
    bin.install asset => "janus"
  end

  test do
    assert_match "janus", shell_output("#{bin}/janus --help")
  end
end
