class Kopi < Formula
  desc "Kopi is a JDK version management tool written in Rust that integrates with your shell to seamlessly switch between different Java Development Kit versions."
  homepage "https://kopi-vm.github.io/"
  license "Apache-2.0"
  version "0.0.7"

  on_macos do
    on_intel do
      url "https://github.com/kopi-vm/kopi/releases/download/v0.0.7/kopi-0.0.7-macos-x86_64.tar.gz"
      sha256 "27febb55c205740af3093a7438686bb7f9878bad57268b243507235626eaac8c"
    end

    on_arm do
      url "https://github.com/kopi-vm/kopi/releases/download/v0.0.7/kopi-0.0.7-macos-aarch64.tar.gz"
      sha256 "72141b95867bc12a627538cd8103af4869fd93f3cdd374c6bc2cca37e4916db7"
    end
  end

  def install
    bin.install "kopi", "kopi-shim"
  end

  def post_install
    system "#{bin}/kopi", "setup"
  end

  test do
    system "#{bin}/kopi", "--version"
  end

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end
end
