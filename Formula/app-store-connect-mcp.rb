class AppStoreConnectMcp < Formula
  desc "MCP server for the App Store Connect and Xcode Cloud read API"
  homepage "https://github.com/ShipItSwifty/app-store-connect-mcp"
  license "MIT"

  head "https://github.com/ShipItSwifty/app-store-connect-mcp.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ShipItSwifty/app-store-connect-mcp/releases/download/0.1.6/app-store-connect-mcp-0.1.6-macos-universal.tar.gz"
      sha256 "0d63103c4ed7f52ea8de7f327877a3f1c413faf49d7a16e775277494df62e4d5"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/app-store-connect-mcp/releases/download/0.1.6/app-store-connect-mcp-0.1.6-linux-x86_64.tar.gz"
      sha256 "0541e2b12edfa4438845bfe3825e01b6da240f4ac00ff6dcc9f00a2411e132e2"
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
