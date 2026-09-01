class AppStoreConnectMcp < Formula
  desc "MCP server for the App Store Connect and Xcode Cloud read API"
  homepage "https://github.com/ShipItSwifty/app-store-connect-mcp"
  license "MIT"

  head "https://github.com/ShipItSwifty/app-store-connect-mcp.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ShipItSwifty/app-store-connect-mcp/releases/download/0.1.3/app-store-connect-mcp-0.1.3-macos-universal.tar.gz"
      sha256 "2a4d510c1df0d617586cf5158e28a9f823bed419d056ae86b9d859dd6bc527a4"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/app-store-connect-mcp/releases/download/0.1.3/app-store-connect-mcp-0.1.3-linux-x86_64.tar.gz"
      sha256 "677c99172e9185753956421a4cf6524eb4f0b93a28bfec26df702d1bd1aea84d"
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
