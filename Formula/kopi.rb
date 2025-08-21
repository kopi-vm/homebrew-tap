class Kopi < Formula
  desc "JDK version management tool"
  homepage "https://kopi-vm.github.io/"
  version "0.1.2"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_intel do
      url "https://github.com/kopi-vm/kopi/releases/download/v0.1.2/kopi-0.1.2-macos-x86_64.tar.gz"
      sha256 "4c6fc6b9b54372e3556b348c5d58a8edd53237789d93cbb116f159abc75df8fe"
    end

    on_arm do
      url "https://github.com/kopi-vm/kopi/releases/download/v0.1.2/kopi-0.1.2-macos-aarch64.tar.gz"
      sha256 "ce6cf3e1568e4390b66db3a55498d1ed369c700bf9aeb6b739701ad5b5cbbea4"
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
