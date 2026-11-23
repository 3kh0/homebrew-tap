cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.162"
  sha256 arm:   "32b8d81017095f024f434c6b6ffa61a2b01684b99b2a0a2324c3d86dd597e1ac",
         intel: "dfac7d414dc66402bce598f73236e21165ba5d0c02512ca0acb79095bf457f3f"

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
