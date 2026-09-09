class Janus < Formula
  desc "Personal historian for makers — synthesizes git + Claude Code sessions into Obsidian"
  homepage "https://github.com/crewtives/janus"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-macos-arm64"
      sha256 "e366487c65fa9a4c5317356ff19a7c68cb7ed61d6afdc3e6557c58ae29179687"
    end
    on_intel do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-macos-x64"
      sha256 "26227edd09f9b1ff34c8240f74692fc6ed9555a0c497869194037633f9c1a798"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-linux-arm64"
      sha256 "433c360d6605b8cbacc13034976b5f2d7da3fa524e863ac5e20e520fa83003f1"
    end
    on_intel do
      url "https://github.com/crewtives/janus/releases/download/v#{version}/janus-linux-x64"
      sha256 "11b9ece0309399fc71df6bb5fd8cdec9128133684149e0cef577cb08e55ce982"
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
