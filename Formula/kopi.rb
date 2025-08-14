class Kopi < Formula
  desc "JDK version management tool"
  homepage "https://kopi-vm.github.io/"
  version "0.0.9"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_intel do
      url "https://github.com/kopi-vm/kopi/releases/download/v0.0.9/kopi-0.0.9-macos-x86_64.tar.gz"
      sha256 "4aa63e3532a5a2e1a23e3fc2646d37952be7dd8f60b6a31143b53777d3b3d799"
    end

    on_arm do
      url "https://github.com/kopi-vm/kopi/releases/download/v0.0.9/kopi-0.0.9-macos-aarch64.tar.gz"
      sha256 "a9ceb5d0b97f0a2b228ba4a903f4fb41812857fa61eca9f5ac60fc0e9f75f695"
    end
  end

  def install
    bin.install "kopi", "kopi-shim"
  end

  def caveats
    <<~EOS
      Thanks for installing Kopi! To get started, you need to run the setup command.
      This will initialize your configuration and prepare the environment.

      Please run:

        kopi setup
    EOS
  end

  test do
    system "#{bin}/kopi", "--version"
  end
end
