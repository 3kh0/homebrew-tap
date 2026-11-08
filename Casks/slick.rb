cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.154"
  sha256 arm:   "7ad0f3d7a8939659bc64b0eee103dd651cc4a93abf9ba4b64199b25f0e83ad13",
         intel: "238980f533c8dadbe315b2f8c55908d26d225d247de4b4192461e77224adcc14"

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
