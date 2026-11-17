cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.159"
  sha256 arm:   "cb2439c38666898d0f87dc328fc36afb97c102bc867ae51f875b2b8bc973d831",
         intel: "554dffba336c2f5d06c422ab9745476e1b391a7542e2ce2fb659990d83cac1e6"

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
