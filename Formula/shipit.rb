class Shipit < Formula
  desc "Swift-native CLI toolkit for iOS and Android release automation"
  homepage "https://github.com/shipitswifty/shipitswifty"
  license "MIT"

  head "https://github.com/ShipItSwifty/shipitswifty.git", branch: "main"

  stable do
    version "0.2.1"

    on_macos do
      url "https://github.com/ShipItSwifty/shipitswifty/releases/download/0.2.1/shipit-0.2.1-macos-universal.tar.gz"
      sha256 "7a5900e71aca8681f02328e8df4e86692c2b1b96c76bb552e1e95b13ec7cab72"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/shipitswifty/releases/download/0.2.1/shipit-0.2.1-linux-static.tar.gz"
      sha256 "f4ac64b5d7aa5b743aaf3ad7c82aa57db91ebbf37869a7775748b3ec09d7661a"
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
