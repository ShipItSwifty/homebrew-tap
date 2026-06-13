class Shipit < Formula
  desc "Swift-native CLI toolkit for iOS and Android release automation"
  homepage "https://github.com/shipitswifty/shipitswifty"
  url "https://github.com/shipitswifty/shipitswifty/archive/refs/tags/0.2.0.tar.gz"
  sha256 "a7ccc65abf8e304e96995097fe817b174bb3042e475077b7af1b97e0d337da18"
  license "MIT"
  head "https://github.com/shipitswifty/shipitswifty.git", branch: "main"

  bottle do
    root_url "https://github.com/ShipItSwifty/homebrew-tap/releases/download/shipit-0.2.0"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e2dda55898cb3eabd8b388f2918f9ae4386e20ad6574d6625727d0f543b83153"
    sha256 cellar: :any,                 x86_64_linux: "1a93dad79bfe0e8ec5572204631b12581ecf22d8ce3953104e102be58c601260"
  end

  uses_from_macos "swift" => :build
  uses_from_macos "curl"
  uses_from_macos "libxml2"

  def install
    args = if OS.mac?
      ["--disable-sandbox"]
    else
      [
        "--static-swift-stdlib",
        "-Xlinker",
        "-L#{Formula["curl"].opt_lib}",
        "-Xlinker",
        "-L#{Formula["libxml2"].opt_lib}",
      ]
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
