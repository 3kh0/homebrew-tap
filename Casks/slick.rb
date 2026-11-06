cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.151"
  sha256 arm:   "7121c804962b05a9be52b45e592fdf8f6c9bf6945a1e5884474e6aabf010917e",
         intel: "fa8c524fc64f8a14fdcaee8121ed9db7827880c16ca840fccfcb0e224987dc37"

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
