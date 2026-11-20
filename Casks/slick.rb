cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.160"
  sha256 arm:   "d554848e87a0b11c9a82c5eef956f45689a8a9c4a01dad745dc771bd2cbc57b9",
         intel: "2c2b634b378f694fe3ab9fa2f53408d471248aca1ddc67ec82dca3fb8e406f5f"

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
