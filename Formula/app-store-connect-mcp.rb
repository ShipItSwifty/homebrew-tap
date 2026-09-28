class AppStoreConnectMcp < Formula
  desc "MCP server for the App Store Connect and Xcode Cloud read API"
  homepage "https://github.com/ShipItSwifty/app-store-connect-mcp"
  license "MIT"

  head "https://github.com/ShipItSwifty/app-store-connect-mcp.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ShipItSwifty/app-store-connect-mcp/releases/download/0.1.8/app-store-connect-mcp-0.1.8-macos-universal.tar.gz"
      sha256 "1feddbec592324fdd34546a4a8b00c51d26d86f609f588237c954ae0a140fe7b"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/app-store-connect-mcp/releases/download/0.1.8/app-store-connect-mcp-0.1.8-linux-x86_64.tar.gz"
      sha256 "e631cb31dd8bf78df6d7f966a5bd1bc7e94d3f7b5b5fa749b0eeee316161bbc8"
    end
  end

  def install
    bin.install "app-store-connect-mcp"
  end

  test do
    assert_match(/\A\d+\.\d+\.\d+/, shell_output("#{bin}/app-store-connect-mcp --version"))
    assert_match "USAGE:", shell_output("#{bin}/app-store-connect-mcp --help")
  end
end
