cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.141"
  sha256 arm:   "15bac94c0e13b03cd60027d041e96456f3e88f476d4efa9dd9fbc21286ea7f0e",
         intel: "a43b4fd094fde12e6c4250eaccd44b5b3cfa7492314aecdfdd606a006737aa9e"

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
