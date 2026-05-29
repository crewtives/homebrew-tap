class Janus < Formula
  desc "Personal historian for makers — synthesizes git + Claude Code sessions into Obsidian"
  homepage "https://github.com/crewtives/janus"
  version "0.2.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/crewtives/janus/releases/download/v0.2.8/janus-macos-arm64"
      sha256 "a2b3f01216946b5c17a3e556705fbc70e2607361f811034eeddd54e6806434d9"
    end
    on_intel do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-macos-x64"
      sha256 "d547019c14fe820600996bd2990853dc4b0df8db49071d88ac8b3061928064b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-linux-arm64"
      sha256 "81a0441c7f04d4a198b659b1475b96e5d361681796ca4599b341950ca15f609d"
    end
    on_intel do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-linux-x64"
      sha256 "daa28f452f4dde78b788da5d6fbc94d125ed36b8da144ce07130f7bf2108cf36"
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
