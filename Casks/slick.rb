cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.149"
  sha256 arm:   "1783b152386ae80d55b614926e0f00536dbc0f01ebe529c5629ace15ee70eeeb",
         intel: "f9b8f4b9a4834c650b6c28c8a7d6d70a1eb60a4868ad13485c96dab282e1dcbf"

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
