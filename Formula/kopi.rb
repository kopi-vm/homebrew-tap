class Kopi < Formula
  desc "JDK version management tool"
  homepage "https://kopi-vm.github.io/"
  version "0.1.1"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_intel do
      url "https://github.com/kopi-vm/kopi/releases/download/v0.1.1/kopi-0.1.1-macos-x86_64.tar.gz"
      sha256 "07316f41ead7cc073f889df6ef6f62a6bf5b79d656b2a8a170b14fb3a711f364"
    end

    on_arm do
      url "https://github.com/kopi-vm/kopi/releases/download/v0.1.1/kopi-0.1.1-macos-aarch64.tar.gz"
      sha256 "066686cf132164b4fe288ac75342bc239e745f143fa1be4f1387306111d0de85"
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
