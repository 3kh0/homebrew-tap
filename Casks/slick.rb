cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.152"
  sha256 arm:   "6a3890ca3b78ee44620bb01143383bbe373f871e4bf1418036823171b3bf5837",
         intel: "e2552e0099a7ac025e48a61d797926637a7954cf29bee0081c3c0b8ce111e89b"

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
