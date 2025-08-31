class Kopi < Formula
  desc "JDK version management tool"
  homepage "https://kopi-vm.github.io/"
  version "0.1.4"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_intel do
      url "https://github.com/kopi-vm/kopi/releases/download/v0.1.4/kopi-0.1.4-macos-x86_64.tar.gz"
      sha256 "db23ab4a8e8ec3c6fc476abeb7600285320c8c555b90b3eae31563ab7d9a7eb5"
    end

    on_arm do
      url "https://github.com/kopi-vm/kopi/releases/download/v0.1.4/kopi-0.1.4-macos-aarch64.tar.gz"
      sha256 "7d024a402e12b317687b9f7796ebb798a9ffa7494858d3fe3d3d71742595a98f"
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
