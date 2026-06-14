class Shipit < Formula
  desc "Swift-native CLI toolkit for iOS and Android release automation"
  homepage "https://github.com/shipitswifty/shipitswifty"
  license "MIT"

  head "https://github.com/ShipItSwifty/shipitswifty.git", branch: "main"

  stable do
    version "0.2.1"

    on_macos do
      url "https://github.com/ShipItSwifty/shipitswifty/releases/download/0.2.1/shipit-0.2.1-macos-universal.tar.gz"
      sha256 "c132c9b190897c952c80524af234a3db39496a781e8c91de9e95f415d899de6b"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/shipitswifty/releases/download/0.2.1/shipit-0.2.1-linux-static.tar.gz"
      sha256 "c132c9b190897c952c80524af234a3db39496a781e8c91de9e95f415d899de6b"
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
