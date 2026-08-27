class Shipit < Formula
  desc "Swift-native CLI toolkit for iOS and Android release automation"
  homepage "https://github.com/shipitswifty/shipitswifty"
  license "MIT"

  head "https://github.com/ShipItSwifty/shipitswifty.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ShipItSwifty/shipitswifty/releases/download/0.6.1/shipit-0.6.1-macos-universal.tar.gz"
      sha256 "57a21bb23aa6877c2f5fb710389380773f598cccdf9cba863ebdb05ab946bad0"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/shipitswifty/releases/download/0.6.1/shipit-0.6.1-linux-static.tar.gz"
      sha256 "affa930e62a701f979d8ee6c50cc24f1541701aced89299ed9bf74883a09d7b7"
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
