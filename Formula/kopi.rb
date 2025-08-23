class Kopi < Formula
  desc "JDK version management tool"
  homepage "https://kopi-vm.github.io/"
  version "0.1.3"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_intel do
      url "https://github.com/kopi-vm/kopi/releases/download/v0.1.3/kopi-0.1.3-macos-x86_64.tar.gz"
      sha256 "71ebbc16334458d482fe4afb17375ec81eb60cd568a3c87636aef73beb460485"
    end

    on_arm do
      url "https://github.com/kopi-vm/kopi/releases/download/v0.1.3/kopi-0.1.3-macos-aarch64.tar.gz"
      sha256 "aede72e67c2795232b2e7c98e80c71e13ce4451628af257baaab860161b2cab0"
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
