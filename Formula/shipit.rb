class Shipit < Formula
  desc "Swift-native CLI toolkit for iOS and Android release automation"
  homepage "https://github.com/shipitswifty/shipitswifty"
  license "MIT"

  head "https://github.com/ShipItSwifty/shipitswifty.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ShipItSwifty/shipitswifty/releases/download/0.4.0/shipit-0.4.0-macos-universal.tar.gz"
      sha256 "4cdc21454c5fc9127e5be80dd04cf18ffc37809a66790244e1ca5fd6bb7bd901"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/shipitswifty/releases/download/0.4.0/shipit-0.4.0-linux-static.tar.gz"
      sha256 "4251cc98a6c46f1829decbc8619cdba22a0df60f6a28a2e2e195f8729bf51f2a"
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
