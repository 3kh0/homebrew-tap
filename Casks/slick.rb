cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.135"
  sha256 arm:   "028f4010cf000d5d9318260a90e390b93f5e5ecc9a40653403e89e381bd49e84",
         intel: "0956eaa751fb8203f7d5badfb2063df77d0db989eb987765a240415d3260de47"

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
