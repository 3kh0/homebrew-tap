cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.150"
  sha256 arm:   "993d170d2a71856317ecdea25aac6ec65e0c798aca2c1cde6bf60b595701ac43",
         intel: "b23d2a6f9d8d3edea2acb548c3c65756cd5692e8a2a79c056c726ca8117e60ee"

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
