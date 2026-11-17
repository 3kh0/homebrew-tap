cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.157"
  sha256 arm:   "2e46b2ea248dcb5170e8e95f9308159ae6045e6a747b71571c4a61db7d747db2",
         intel: "86adc05734f8216ef0490ec90211a4d5ab71c342babd91964f9a2d7646faed13"

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
