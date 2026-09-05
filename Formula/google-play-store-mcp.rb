class GooglePlayStoreMcp < Formula
  desc "MCP server for the Google Play Developer API"
  homepage "https://github.com/ShipItSwifty/google-play-store-mcp"
  license "MIT"

  head "https://github.com/ShipItSwifty/google-play-store-mcp.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ShipItSwifty/google-play-store-mcp/releases/download/0.1.1/google-play-store-mcp-0.1.1-macos-universal.tar.gz"
      sha256 "90b15348050463209feeff571cbe22b6cf770a2c759c3e74e0319437aa16e712"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/google-play-store-mcp/releases/download/0.1.1/google-play-store-mcp-0.1.1-linux-x86_64.tar.gz"
      sha256 "eaf6c1f49704249620377addff199e470c36078f62a7ab4af3bbf84dccd708e7"
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
