cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.146"
  sha256 arm:   "17820c275db2d40ffd2ff4b36049a8c2cebbaaa3d1053af82bc4262c43e259d8",
         intel: "1511e4e466fae6ca9aeec71795465bf6c39a20c497fc5618dfd3416a922f777c"

  url "https://github.com/3kh0/slick/releases/download/v#{version.split(".").last}/Slick-#{version}-mac-#{arch}.zip"
  name "Slick"
  desc "Slack client with custom themes and plugins"
  homepage "https://github.com/3kh0/slick"

  livecheck do
    url :url
    regex(/^v(\d+)$/i)
    strategy :github_latest do |json, regex|
      match = json["tag_name"]&.match(regex)
      "2.0.#{match[1]}" if match
    end
  end

  auto_updates true
  depends_on cask: "slack"
  depends_on macos: :ventura

  app "Slick.app"

  zap trash: "~/Library/Application Support/Slick"
end
