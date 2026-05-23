class Janus < Formula
  desc "Personal historian for makers — synthesizes git + Claude Code sessions into Obsidian"
  homepage "https://github.com/crewtives/janus"
  version "0.2.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/crewtives/janus/releases/download/v0.2.7/janus-macos-arm64"
      sha256 "7bd567f5f67e020687cbf29dec04ed0a8baa78d73d6c759f4bfeffadc9e2b938"
    end
    on_intel do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-macos-x64"
      sha256 "56ea0b1f4f31a16b59b37798a263333aeb36861d9734df289dabd3949d26e8e8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-linux-arm64"
      sha256 "ec42bba4da8549c80d5232523151dfe1333475850e3ce2894f79ce5bdd6bdd51"
    end
    on_intel do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-linux-x64"
      sha256 "49b7c5a44d233bfcb822933a2b0c84361591eb50dfd441e7234ac45a106916f4"
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
