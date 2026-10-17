cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.134"
  sha256 arm:   "60d7f2a50130ff6cb28bc78a1ceddccf980ba02565d84c3c5d3e6c40a07e5b1f",
         intel: "139dfdeb7d4d7d2dce826f71549a6efb9c3cf97e6d703dd1273412bbc3584e3e"

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
