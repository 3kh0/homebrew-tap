cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.144"
  sha256 arm:   "39bcb334eb025a97f43a0a043c05c59a144e4157a71718c609bef25948641e32",
         intel: "8f49a06efd572c38c1fa172948bb1bd27061f4b205a1d75d201764eaea1f5093"

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
