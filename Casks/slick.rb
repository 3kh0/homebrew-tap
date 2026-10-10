cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.129"
  sha256 arm:   "5cd02f2435278f781209b7e0fe598d7af09c77ac303564fef5e4f077bf50b1eb",
         intel: "2597f91646ee099b2a465c722972304822341f546bffec7bcff2f880f63489c4"

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
