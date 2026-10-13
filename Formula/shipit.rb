class Shipit < Formula
  desc "Swift-native CLI toolkit for iOS and Android release automation"
  homepage "https://github.com/shipitswifty/shipitswifty"
  license "MIT"

  head "https://github.com/ShipItSwifty/shipitswifty.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ShipItSwifty/shipitswifty/releases/download/0.7.0/shipit-0.7.0-macos-universal.tar.gz"
      sha256 "c89723ed423938f10707a16d09ddf5aabd63694713052d5c8af12cc1362174cc"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/shipitswifty/releases/download/0.7.0/shipit-0.7.0-linux-static.tar.gz"
      sha256 "3d169b035e4c3a12fae8b7f73884be0e99df5566881fd0d01f9520cf215ed53b"
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
