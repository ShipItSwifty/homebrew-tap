class Shipit < Formula
  desc "Swift-native CLI toolkit for iOS and Android release automation"
  homepage "https://github.com/shipitswifty/shipitswifty"
  license "MIT"

  head "https://github.com/ShipItSwifty/shipitswifty.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ShipItSwifty/shipitswifty/releases/download/0.5.0/shipit-0.5.0-macos-universal.tar.gz"
      sha256 "3884b981ac816ef34dc7dafcf50de9c925172cc1b7d1eefbf3721396ac1a4666"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/shipitswifty/releases/download/0.5.0/shipit-0.5.0-linux-static.tar.gz"
      sha256 "ef141708bfad66fc64eabdd490dce721e1d3742be82ff2925d7f10a3ddd0b347"
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
