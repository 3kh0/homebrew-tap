cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.128"
  sha256 arm:   "4cf0f7838b5f04a15392c3d90d1fcc35cb84261ee5635090a543fc27cdad48ce",
         intel: "2670ddd9d4e031167dd4660806972e73ca7ceacb678ebe06e5c3f47ad0bcf9a9"

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
