class Janus < Formula
  desc "Personal historian for makers — synthesizes git + Claude Code sessions into Obsidian"
  homepage "https://github.com/crewtives/janus"
  version "0.5.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-macos-arm64"
      sha256 "56fc0b01b0ac1e1d336a93e371af3db3e42b4dfd0ed86fa0332b83d674811d0d"
    end
    on_intel do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-macos-x64"
      sha256 "44ffe4fb9001ff611dcb8428ce7eec36837a000800d078a28b294b9921d73776"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-linux-arm64"
      sha256 "48355e90a1392fc5c496e1dd8aa946235b386cd04d8eb8cfc2d181bed3d4be7a"
    end
    on_intel do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-linux-x64"
      sha256 "1eb644a7484cfc725c90671c5a5641d08d774b71958c6b9e35932ae16e1e41f4"
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
