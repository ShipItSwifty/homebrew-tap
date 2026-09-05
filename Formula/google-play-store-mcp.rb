class GooglePlayStoreMcp < Formula
  desc "MCP server for the Google Play Developer API"
  homepage "https://github.com/ShipItSwifty/google-play-store-mcp"
  license "MIT"

  head "https://github.com/ShipItSwifty/google-play-store-mcp.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ShipItSwifty/google-play-store-mcp/releases/download/0.1.0/google-play-store-mcp-0.1.0-macos-universal.tar.gz"
      sha256 "024216b3ae2c5f61b19a8a8cf8978dccebfd906c4d8b0b37a8d2a7f7d7998406"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/google-play-store-mcp/releases/download/0.1.0/google-play-store-mcp-0.1.0-linux-x86_64.tar.gz"
      sha256 "c55394b8745a1815016b5d6d204b81360383e54168c733458ae4bbae533b670c"
    end
  end

  def install
    bin.install "google-play-store-mcp"
  end

  test do
    assert_match(/\A\d+\.\d+\.\d+/, shell_output("#{bin}/google-play-store-mcp --version"))
    assert_match "USAGE:", shell_output("#{bin}/google-play-store-mcp --help")
  end
end
