cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.140"
  sha256 arm:   "59d24e825578a25621322fade2bd51d9a13d63c743340b50c67eb7cc2b1ffbf0",
         intel: "168bc21321918c8eace23b07a656ed0ca18906eaae788e35c8d111468a5a4792"

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
