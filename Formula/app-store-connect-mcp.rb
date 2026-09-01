class AppStoreConnectMcp < Formula
  desc "MCP server for the App Store Connect and Xcode Cloud read API"
  homepage "https://github.com/ShipItSwifty/app-store-connect-mcp"
  license "MIT"

  head "https://github.com/ShipItSwifty/app-store-connect-mcp.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ShipItSwifty/app-store-connect-mcp/releases/download/0.1.2/app-store-connect-mcp-0.1.2-macos-universal.tar.gz"
      sha256 "de41622c15e9534ee1fb0e4e85a09c6cf1cfcb6677dff350f8caf76b5705ccfe"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/app-store-connect-mcp/releases/download/0.1.2/app-store-connect-mcp-0.1.2-linux-x86_64.tar.gz"
      sha256 "cf4a4710aaf1da64a35ca2557ee2c07f9731f411574ff39b99de4aa081738c97"
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
