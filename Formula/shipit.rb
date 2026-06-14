class Shipit < Formula
  desc "Swift-native CLI toolkit for iOS and Android release automation"
  homepage "https://github.com/shipitswifty/shipitswifty"
  version "0.2.0"
  license "MIT"

  on_macos do
    url "https://github.com/ShipItSwifty/shipitswifty/releases/download/0.2.0/shipit-macos-universal.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  on_linux do
    on_intel do
      url "https://github.com/ShipItSwifty/shipitswifty/releases/download/0.2.0/shipit-linux-amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "shipit"
  end

  test do
    assert_match "OVERVIEW: Swift-native CLI for iOS and Android app release automation.",
                 shell_output("#{bin}/shipit --help")
    assert_match(/\A\d+\.\d+\.\d+/, shell_output("#{bin}/shipit --version"))
  end
end
