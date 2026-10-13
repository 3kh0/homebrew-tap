cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.131"
  sha256 arm:   "4d7165df94e8c72e4bdc31c4fa6fa0330d2557f2f491b5769b527b29946c38d9",
         intel: "213327420c7439f61cba0f6e9d8c7e1ba9e9c6a88f66ffa3bfdfa63848478154"

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
