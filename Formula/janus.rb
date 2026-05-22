class Janus < Formula
  desc "Personal historian for makers — synthesizes git + Claude Code sessions into Obsidian"
  homepage "https://github.com/crewtives/janus"
  version "0.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/crewtives/janus/releases/download/v0.2.4/janus-macos-arm64"
      sha256 "32d725a40fd7f0758fd8fa9d6b0943337b1465b526837b06c59cc26c5b6e0922"
    end
    on_intel do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-macos-x64"
      sha256 "52955b30581744f936b9683ce1f763d78e933d168d99ad014a168d5dea7944ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-linux-arm64"
      sha256 "dad8e5421bf3361a2929d947263bc20a29fd35da30392df122ea92ee62543c9c"
    end
    on_intel do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-linux-x64"
      sha256 "1e4df346356dc4083c08038e78cf895c660e3658654efbc6a106590c42d093db"
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
