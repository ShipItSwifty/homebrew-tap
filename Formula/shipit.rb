class Shipit < Formula
  desc "Swift-native CLI toolkit for iOS and Android release automation"
  homepage "https://github.com/shipitswifty/shipitswifty"
  license "MIT"

  head "https://github.com/ShipItSwifty/shipitswifty.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ShipItSwifty/shipitswifty/releases/download/0.3.0/shipit-0.3.0-macos-universal.tar.gz"
      sha256 "1045cbf8c2b161cd533bab62eee6206726e5b84f13dc2d02d2a9813ffe71b6c7"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/shipitswifty/releases/download/0.3.0/shipit-0.3.0-linux-static.tar.gz"
      sha256 "c9850eec6aabc0cfe62e3879afdda8e15c0b9c1528ad3a7d54b9049951485809"
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
