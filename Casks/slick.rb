cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.142"
  sha256 arm:   "e1d45dfce9588b5985e1f8878eb5d82a3ec7ac24babc67fd972d84fec23b44fe",
         intel: "0dfdec5da808abd80756b8f035e336f01626fe99350f423f63d64eff52094799"

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
