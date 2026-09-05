class GooglePlayStoreMcp < Formula
  desc "MCP server for the Google Play Developer API"
  homepage "https://github.com/ShipItSwifty/google-play-store-mcp"
  license "MIT"

  head "https://github.com/ShipItSwifty/google-play-store-mcp.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ShipItSwifty/google-play-store-mcp/releases/download/0.1.2/google-play-store-mcp-0.1.2-macos-universal.tar.gz"
      sha256 "0b9d07fb0fafb7677c213fa59187a10ac2f1ed335ad333a18072b4c0d19cc3a3"
    end

    on_linux do
      url "https://github.com/ShipItSwifty/google-play-store-mcp/releases/download/0.1.2/google-play-store-mcp-0.1.2-linux-x86_64.tar.gz"
      sha256 "d7d8abef02fe71a5e297a729f3c103cc04cf10902cc4e017bf30483e320c431b"
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
