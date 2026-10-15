cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.132"
  sha256 arm:   "3b8e7e55db51e1f5e577f5c1547efdc45e6f37c8d4ba0870534d7595bc9d2626",
         intel: "5ee56945bff446d4115a323509d02fae05ca73456a7a85740c5c45b1d2c5699f"

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
