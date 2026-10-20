cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.138"
  sha256 arm:   "b2802f10a663e4f329745b2040ed19af2c25a87f6b8f87fb4846fabe4b9bdfb7",
         intel: "95c4c72e97cc4604a0b2c45ae589edad4a10b99aa90972c80f55bb37195e67bc"

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
