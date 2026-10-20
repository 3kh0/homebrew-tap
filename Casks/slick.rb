cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.137"
  sha256 arm:   "46d728ad8f5a3abf3782fa51a52fb764f104fc1162e8cec329efb8d38205a968",
         intel: "fbb4246120211222e0003ac1d2d45cd00bcaa1c2e210d61420933eaf3aea777b"

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
