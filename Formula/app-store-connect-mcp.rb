class AppStoreConnectMcp < Formula
  desc "MCP server for the App Store Connect and Xcode Cloud read API"
  homepage "https://github.com/ShipItSwifty/app-store-connect-mcp"
  license "MIT"

  head "https://github.com/ShipItSwifty/app-store-connect-mcp.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ShipItSwifty/app-store-connect-mcp/releases/download/0.1.4/app-store-connect-mcp-0.1.4-macos-universal.tar.gz"
      sha256 "69fb93513444865f7dc40ff62c954ce4a4cb8cad468497add320554a97dadd09"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/app-store-connect-mcp/releases/download/0.1.4/app-store-connect-mcp-0.1.4-linux-x86_64.tar.gz"
      sha256 "51a6713c2da90df1d3d0de3a713af9949fed610b6a2050fc8e4ef2b2f55c3bef"
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
