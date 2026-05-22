class Janus < Formula
  desc "Personal historian for makers — synthesizes git + Claude Code sessions into Obsidian"
  homepage "https://github.com/crewtives/janus"
  version "0.2.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-macos-arm64"
      sha256 "2b6246fbe61533dab6c8b387b5070d8f316def1f5995aa2745eaab712e7def7a"
    end
    on_intel do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-macos-x64"
      sha256 "efe72020c826a704d179ba3ae883f9bb5dc9e848d0cc4e9ea7e6ff5e3afebec0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-linux-arm64"
      sha256 "fef3489ccd082f47e1811a9d9075d74c1ab9e012bb6e86159f455af33b1b19e7"
    end
    on_intel do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-linux-x64"
      sha256 "5ea5c6302c15bd07c541e5ed8bdf03eee09b38e051a3bff26c3b3e4571ab4101"
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
