cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.136"
  sha256 arm:   "d6f352cac32c839613839b40f201d05ce2a4a530445a62db697e2ed216b5691d",
         intel: "f5e9bd622955f68d4ecb7fc71a6c7fd35de2eb27611dfe24db0594d6aa157867"

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
