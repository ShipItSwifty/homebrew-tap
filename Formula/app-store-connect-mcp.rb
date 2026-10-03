class AppStoreConnectMcp < Formula
  desc "MCP server for the App Store Connect and Xcode Cloud read API"
  homepage "https://github.com/ShipItSwifty/app-store-connect-mcp"
  license "MIT"

  head "https://github.com/ShipItSwifty/app-store-connect-mcp.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ShipItSwifty/app-store-connect-mcp/releases/download/0.2.2/app-store-connect-mcp-0.2.2-macos-universal.tar.gz"
      sha256 "d72370193160bca01587f69878718b0682d16ab6007cc59d2da4f7bdbc6b0e7c"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/app-store-connect-mcp/releases/download/0.2.2/app-store-connect-mcp-0.2.2-linux-x86_64.tar.gz"
      sha256 "de0436279b8d79c97444ecc777a2adb7177d5cff0cd75966acb9e76240ef3f6d"
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
