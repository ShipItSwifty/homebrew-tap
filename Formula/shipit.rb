class Shipit < Formula
  desc "Swift-native CLI toolkit for iOS and Android release automation"
  homepage "https://github.com/shipitswifty/shipitswifty"
  license "MIT"

  head "https://github.com/ShipItSwifty/shipitswifty.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ShipItSwifty/shipitswifty/releases/download/0.2.2/shipit-0.2.2-macos-universal.tar.gz"
      sha256 "60f5bade688d72d96633e68fd6c506b0518120206815f3a4aaf99f4169b42ba0"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/shipitswifty/releases/download/0.2.2/shipit-0.2.2-linux-static.tar.gz"
      sha256 "eec5b2a8d334522031816ad45c43721eccb0157b21fd2c0bfb844b0d66e5c637"
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
