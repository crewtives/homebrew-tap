class Janus < Formula
  desc "Personal historian for makers — synthesizes git + Claude Code sessions into Obsidian"
  homepage "https://github.com/crewtives/janus"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/crewtives/janus/releases/download/v0.2.8/janus-macos-arm64"
      sha256 "1fc0a89885803862b536bd590941d58089d00159590b95fd7f9de3220d45e7bf"
    end
    on_intel do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-macos-x64"
      sha256 "636f8554e8207ec3a60167a4e3efaa547f1fed5353a8127ecd208b79bce7995f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-linux-arm64"
      sha256 "49fcf57065c54f188c0a899b03898b7e3ed5e24d63058acefae4f0d2f43a93ad"
    end
    on_intel do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-linux-x64"
      sha256 "78b731a7b2583a8d0cd4b3b97bdf41890a7a2fdbd0cc86b03085436c44f554b6"
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
