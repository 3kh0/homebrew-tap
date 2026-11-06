cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.147"
  sha256 arm:   "ff22e33ed80e81f48611c15af6cf9b6ed42b1afbc9a0b7faa1d2a9dfd2a36176",
         intel: "3bb13e18b50edc1719c6d6d95af5b28b447384a1cce95379899a8f01a47811e6"

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
