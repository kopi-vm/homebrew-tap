class Kopi < Formula
  desc "Kopi is a JDK version management tool written in Rust that integrates with your shell to seamlessly switch between different Java Development Kit versions."
  homepage "https://kopi-vm.github.io/"
  license "Apache-2.0"
  version "0.0.7"

  on_macos do
    on_intel do
      url "https://github.com/kopi-vm/kopi/releases/download/v0.0.7/kopi-0.0.7-macos-x86_64.tar.gz"
      sha256 "bce86e185cb484ce03cb0d7fb45d398a1b9476b1acedc20a19f7a47e1584b5e0"
    end

    on_arm do
      url "https://github.com/kopi-vm/kopi/releases/download/v0.0.7/kopi-0.0.7-macos-aarch64.tar.gz"
      sha256 "37b0429564181dc272e5e2d372d85e74b7a7adda7c89d2e5fd49535cee4af01a"
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
end
