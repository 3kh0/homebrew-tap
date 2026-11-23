cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.161"
  sha256 arm:   "5579e27e1563bcf6e717630e9a13d1d7dcdae6942921420a8464ec6deada5f9e",
         intel: "b8b830058e655da09735dfbc21cf266b96a96fdbfc44d9b72bb885906bae3c3a"

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
