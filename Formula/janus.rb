class Janus < Formula
  desc "Personal historian for makers — synthesizes git + Claude Code sessions into Obsidian"
  homepage "https://github.com/crewtives/janus"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-macos-arm64"
      sha256 "3d89feb7652b3d8d51df5d3c77c3ab2b71b7b5931980ad317491f635b1f7eba4"
    end
    on_intel do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-macos-x64"
      sha256 "3e418f7b92b0f6723141b9b886093f8aec3499176d7c0788c1294056e7635454"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-linux-arm64"
      sha256 "17ddcc74bb2364de05e798081352c8962abfe6ab6e749c54cd2578738ef53ac0"
    end
    on_intel do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-linux-x64"
      sha256 "7fc19a97cc20dc726b2a7922b97921c69802a612332d03b3ab206eb9882ee030"
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
