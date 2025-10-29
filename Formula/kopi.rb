class Kopi < Formula
  desc "JDK version management tool"
  homepage "https://kopi-vm.github.io/"
  version "0.2.3"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_intel do
      url "https://github.com/kopi-vm/kopi/releases/download/v0.2.3/kopi-0.2.3-macos-x86_64.tar.gz"
      sha256 "db256cddff636381625ef5ce146615a6e597c5b8b346d91e49c8040e5f30a36d"
    end

    on_arm do
      url "https://github.com/kopi-vm/kopi/releases/download/v0.2.3/kopi-0.2.3-macos-aarch64.tar.gz"
      sha256 "655bf283652da9adda14c917116bac3934b6840092a8189b1b6a3bacfcd5c833"
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
