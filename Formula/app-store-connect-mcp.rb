class AppStoreConnectMcp < Formula
  desc "MCP server for the App Store Connect and Xcode Cloud read API"
  homepage "https://github.com/ShipItSwifty/app-store-connect-mcp"
  license "MIT"

  head "https://github.com/ShipItSwifty/app-store-connect-mcp.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ShipItSwifty/app-store-connect-mcp/releases/download/0.2.1/app-store-connect-mcp-0.2.1-macos-universal.tar.gz"
      sha256 "ba4cb44dba396a5e1ad56dcf4dbaed93eca8ebbb0cf6311948d48a473b0e4a3c"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/app-store-connect-mcp/releases/download/0.2.1/app-store-connect-mcp-0.2.1-linux-x86_64.tar.gz"
      sha256 "59efb22337bd46784cfddb7e6ee0a205909061a0c74c6425542f3571a7b13c8c"
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
