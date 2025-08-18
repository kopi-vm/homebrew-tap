class Kopi < Formula
  desc "JDK version management tool"
  homepage "https://kopi-vm.github.io/"
  version "0.1.0"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_intel do
      url "https://github.com/kopi-vm/kopi/releases/download/v0.1.0/kopi-0.1.0-macos-x86_64.tar.gz"
      sha256 "bf4df99cf1f1fb562aefd67702b716b0a3c882431ea1505bf90932421a4eefad"
    end

    on_arm do
      url "https://github.com/kopi-vm/kopi/releases/download/v0.1.0/kopi-0.1.0-macos-aarch64.tar.gz"
      sha256 "73a68cccaaa36ae652019a3cddd23877311f50a3c5544786736ed74a8ada792f"
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
