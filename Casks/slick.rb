cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.126"
  sha256 arm:   "a2360a6c8d84205504fe0aacf215f8909d9c6312ce008a1339d772e7c99b30f3",
         intel: "f8c675a3c3e7eb34f217afcfac76071c6b0435b176c85dcd139fb1eb7e65f335"

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
