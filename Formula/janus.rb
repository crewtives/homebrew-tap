class Janus < Formula
  desc "Personal historian for makers — synthesizes git + Claude Code sessions into Obsidian"
  homepage "https://github.com/crewtives/janus"
  version "0.2.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/crewtives/janus/releases/download/v0.2.5/janus-macos-arm64"
      sha256 "2b6246fbe61533dab6c8b387b5070d8f316def1f5995aa2745eaab712e7def7a"
    end
    on_intel do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-macos-x64"
      sha256 "13d774ff6a33529edd7013b3fe7a5f88d09b54f3cb1c06a3b143d5aed04d971a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-linux-arm64"
      sha256 "9c6f7c71b9391395b839c9595e4296ee3631f9d2e2ec696ce81e5302d34adaba"
    end
    on_intel do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-linux-x64"
      sha256 "83f7ec3cdb4f16cc0339b61fa0fbec59060259ec27716faadb5dca8c8068efe4"
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
