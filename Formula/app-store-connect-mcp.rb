class AppStoreConnectMcp < Formula
  desc "MCP server for the App Store Connect and Xcode Cloud read API"
  homepage "https://github.com/ShipItSwifty/app-store-connect-mcp"
  license "MIT"

  head "https://github.com/ShipItSwifty/app-store-connect-mcp.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ShipItSwifty/app-store-connect-mcp/releases/download/0.3.0/app-store-connect-mcp-0.3.0-macos-universal.tar.gz"
      sha256 "ad422e40aef654a5976fb05a6637f18b27ba7482b3671e16af3b0291a8efe093"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/app-store-connect-mcp/releases/download/0.3.0/app-store-connect-mcp-0.3.0-linux-x86_64.tar.gz"
      sha256 "3a0063e986fea64d7c4508a36df97d98003bb8c351169f1b49c33723bc3b0031"
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
