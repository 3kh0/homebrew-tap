cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.127"
  sha256 arm:   "4c2e1ab35c658f9df1260f6f6908d0ea4957640baf54f8472e791b84ba6f0612",
         intel: "8b1889adc0f155a78d738215c3b3ba91c61437619868da9d44c7ba4c55e8522e"

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
