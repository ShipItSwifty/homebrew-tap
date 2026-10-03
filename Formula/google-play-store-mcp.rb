class GooglePlayStoreMcp < Formula
  desc "MCP server for the Google Play Developer API"
  homepage "https://github.com/ShipItSwifty/google-play-store-mcp"
  license "MIT"

  head "https://github.com/ShipItSwifty/google-play-store-mcp.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ShipItSwifty/google-play-store-mcp/releases/download/0.2.1/google-play-store-mcp-0.2.1-macos-universal.tar.gz"
      sha256 "7475905d96f7c5d68dbb056ff01f718d491625774669f03d4f0fffdc64c6be98"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/google-play-store-mcp/releases/download/0.2.1/google-play-store-mcp-0.2.1-linux-x86_64.tar.gz"
      sha256 "0ed71abaf5fc92e84127ec7fffd4612ceea1dd073db244e7f52cac5b30ef4048"
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
