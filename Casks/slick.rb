cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.163"
  sha256 arm:   "563abf2b4435b44e34dd0367638742b0b1128dae3e4d1c34be2560bdcf41c0d4",
         intel: "d9f27f525f77ba8a967dbff00666932c72e491880215ee63c684a0f39af3683f"

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
