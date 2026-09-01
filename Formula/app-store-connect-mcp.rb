class AppStoreConnectMcp < Formula
  desc "MCP server for the App Store Connect and Xcode Cloud read API"
  homepage "https://github.com/ShipItSwifty/app-store-connect-mcp"
  license "MIT"

  head "https://github.com/ShipItSwifty/app-store-connect-mcp.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ShipItSwifty/app-store-connect-mcp/releases/download/0.1.5/app-store-connect-mcp-0.1.5-macos-universal.tar.gz"
      sha256 "1b1e1bf1fce5bc512c18f2a12c59da724ab51609c3da82b833384f4c19c8b1d7"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/app-store-connect-mcp/releases/download/0.1.5/app-store-connect-mcp-0.1.5-linux-x86_64.tar.gz"
      sha256 "feac95f1c3849edf5085258e4f1a9248e80993e0605b25abc995db16ebeaa422"
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
