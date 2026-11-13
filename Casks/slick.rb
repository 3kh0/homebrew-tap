cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.156"
  sha256 arm:   "5417a6ed6b484e551d8f6b59d79c835a60f26b475f5db24ed91ef2471f18c9a9",
         intel: "1355aae8aead4d92e2130ec288a8d74cd5bb72c7b860e8da180b03a4fdbdef22"

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
