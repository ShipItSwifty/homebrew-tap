class AppStoreConnectMcp < Formula
  desc "MCP server for the App Store Connect and Xcode Cloud read API"
  homepage "https://github.com/ShipItSwifty/app-store-connect-mcp"
  license "MIT"

  head "https://github.com/ShipItSwifty/app-store-connect-mcp.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ShipItSwifty/app-store-connect-mcp/releases/download/0.2.0/app-store-connect-mcp-0.2.0-macos-universal.tar.gz"
      sha256 "ab8fc90197b19982e5c6ffd1432227c8fee166fa5ef00c6e2b93deaa14150035"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/app-store-connect-mcp/releases/download/0.2.0/app-store-connect-mcp-0.2.0-linux-x86_64.tar.gz"
      sha256 "9f0b9b04056961dee8c93f084b8fe1e94fdaee395aa4e3bc86616fab50012be8"
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
