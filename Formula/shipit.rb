class Shipit < Formula
  desc "Swift-native CLI toolkit for iOS and Android release automation"
  homepage "https://github.com/shipitswifty/shipitswifty"
  url "https://github.com/shipitswifty/shipitswifty/archive/refs/tags/0.1.0.tar.gz"
  sha256 "8024e63c3b67a3f1c8ddbb31bf0b233c3ca4701ff53525a6bffa54fecc186e53"
  license "MIT"
  head "https://github.com/shipitswifty/shipitswifty.git", branch: "main"

  bottle do
    root_url "https://github.com/ShipItSwifty/homebrew-tap/releases/download/shipit-0.1.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "ccf46d7c2fab735a2ff92bfa0723836fcbb2b79e969f586e5efd1ad5bfcb8982"
  end

  uses_from_macos "swift" => :build

  def install
    args = if OS.mac?
      ["--disable-sandbox"]
    else
      ["--static-swift-stdlib"]
    end

    system "swift", "build", *args, "--configuration", "release", "--product", "shipit"
    bin.install ".build/release/shipit"
  end

  test do
    assert_match "OVERVIEW: Swift-native CLI for iOS and Android app release automation.",
                 shell_output("#{bin}/shipit --help")
    assert_match(/\A\d+\.\d+\.\d+/, shell_output("#{bin}/shipit --version"))
  end
end
