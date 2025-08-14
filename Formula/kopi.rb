class Kopi < Formula
  desc "JDK version management tool"
  homepage "https://kopi-vm.github.io/"
  version "0.0.8"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_intel do
      url "https://github.com/kopi-vm/kopi/releases/download/v0.0.8/kopi-0.0.8-macos-x86_64.tar.gz"
      sha256 "1408d2c0fe387329745175244a75cd2cb78c7dd138d41097ee376a2f2239619f"
    end

    on_arm do
      url "https://github.com/kopi-vm/kopi/releases/download/v0.0.8/kopi-0.0.8-macos-aarch64.tar.gz"
      sha256 "4def15eaa17a75c6a8c8789a3a050d77b4c3e869e4300e4f84eafc3784dcfb33"
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
