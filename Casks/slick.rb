cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.158"
  sha256 arm:   "d438fca997ee9c0c91e76a0a6567cf8da9b5368fb4fd7e7febcb3f992ba5e768",
         intel: "8ef9aebbf0814ae4f738c5367de15d2644ec9075ac07b81b449424f42824ef63"

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
