class Janus < Formula
  desc "Personal historian for makers — synthesizes git + Claude Code sessions into Obsidian"
  homepage "https://github.com/crewtives/janus"
  version "0.2.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/crewtives/janus/releases/download/v0.2.8/janus-macos-arm64"
      sha256 "7366d6924d73e15e9004e9cc6fc5eb87491d9f36d4d6baeba215bf93798f8572"
    end
    on_intel do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-macos-x64"
      sha256 "4ffe8f1dcb2a13b0d5bdb00ae1067ce5b67d57c3830b7a079626bc21e471d6ab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-linux-arm64"
      sha256 "35c88a4bada0118287f6c17003295454955d5d48700d61c8094db6132cfbfc35"
    end
    on_intel do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-linux-x64"
      sha256 "f7f50f6e17ac191a08121e2e3346847315550d9a66f0a2be98d7b8442654e65f"
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
