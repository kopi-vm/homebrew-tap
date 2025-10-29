class Kopi < Formula
  desc "JDK version management tool"
  homepage "https://kopi-vm.github.io/"
  version "0.2.0"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_intel do
      url "https://github.com/kopi-vm/kopi/releases/download/v0.2.0/kopi-0.2.0-macos-x86_64.tar.gz"
      sha256 "cff4d04910ad1d468e230e54c458187cf7bab4251db85ff7b04ddaf37fcf83cf"
    end

    on_arm do
      url "https://github.com/kopi-vm/kopi/releases/download/v0.2.0/kopi-0.2.0-macos-aarch64.tar.gz"
      sha256 "26c3c9ebf83730ce98605ae91bd931ca8260f049a2eacfabc169a75d66251ed0"
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
