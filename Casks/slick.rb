cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.148"
  sha256 arm:   "8c08806ba55ccf5d43954fb2f4f3b23f6dc0df767c3736bd380eac8d49253998",
         intel: "edc61ad8dd4c1a78af0135b97ec307560cb7f9122a312166a4e9fb314b73d878"

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
