class Shipit < Formula
  desc "Swift-native CLI toolkit for iOS and Android release automation"
  homepage "https://github.com/shipitswifty/shipitswifty"
  license "MIT"

  head "https://github.com/ShipItSwifty/shipitswifty.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ShipItSwifty/shipitswifty/releases/download/0.5.1/shipit-0.5.1-macos-universal.tar.gz"
      sha256 "7e6dbbd83c3d05b314c03a288aa0f6add1295f95ba3f282b16748cc0294ff0f6"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/shipitswifty/releases/download/0.5.1/shipit-0.5.1-linux-static.tar.gz"
      sha256 "47fa0d3efe4f96f34b03547a47f386f55b23e96c609c9b231c9a352f0470f658"
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
