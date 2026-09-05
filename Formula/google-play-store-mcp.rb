class GooglePlayStoreMcp < Formula
  desc "MCP server for the Google Play Developer API"
  homepage "https://github.com/ShipItSwifty/google-play-store-mcp"
  license "MIT"

  head "https://github.com/ShipItSwifty/google-play-store-mcp.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ShipItSwifty/google-play-store-mcp/releases/download/0.1.3/google-play-store-mcp-0.1.3-macos-universal.tar.gz"
      sha256 "30ef358f917854464ced479ec0a4a89a151a35caafd580459794f6c1275b6a2e"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/google-play-store-mcp/releases/download/0.1.3/google-play-store-mcp-0.1.3-linux-x86_64.tar.gz"
      sha256 "9787250ef061c54e046b92b3239204ad07665fac9cab172221a7c87c098183f8"
    end
  end

  def install
    bin.install "google-play-store-mcp"
  end

  test do
    assert_match(/\A\d+\.\d+\.\d+/, shell_output("#{bin}/google-play-store-mcp --version"))
    assert_match "USAGE:", shell_output("#{bin}/google-play-store-mcp --help")
  end
end
