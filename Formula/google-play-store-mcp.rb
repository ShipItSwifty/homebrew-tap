class GooglePlayStoreMcp < Formula
  desc "MCP server for the Google Play Developer API"
  homepage "https://github.com/ShipItSwifty/google-play-store-mcp"
  license "MIT"

  head "https://github.com/ShipItSwifty/google-play-store-mcp.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ShipItSwifty/google-play-store-mcp/releases/download/0.2.0/google-play-store-mcp-0.2.0-macos-universal.tar.gz"
      sha256 "422ccdcb254af77f70115cdd89fee0023fe508a27eb0e87d5b957ed357709f57"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/google-play-store-mcp/releases/download/0.2.0/google-play-store-mcp-0.2.0-linux-x86_64.tar.gz"
      sha256 "bf03ce0250395e6271fe563500c490548f7521ff438e1bf71bb4f84e6c7aa808"
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
