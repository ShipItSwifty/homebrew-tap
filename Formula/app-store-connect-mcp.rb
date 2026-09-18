class AppStoreConnectMcp < Formula
  desc "MCP server for the App Store Connect and Xcode Cloud read API"
  homepage "https://github.com/ShipItSwifty/app-store-connect-mcp"
  license "MIT"

  head "https://github.com/ShipItSwifty/app-store-connect-mcp.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ShipItSwifty/app-store-connect-mcp/releases/download/0.1.7/app-store-connect-mcp-0.1.7-macos-universal.tar.gz"
      sha256 "b526bddf349bf5d6812b39756b3e3db075539b5f4e5a2009e103d8a5c800712c"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/app-store-connect-mcp/releases/download/0.1.7/app-store-connect-mcp-0.1.7-linux-x86_64.tar.gz"
      sha256 "388f8143f849a2af74679227ac91923016c2ec000b02a9e950de4a9530c49ff3"
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
