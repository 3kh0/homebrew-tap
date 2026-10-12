cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.130"
  sha256 arm:   "0d5cda8bfddcc63651178e6e34be9b75518399321eebdd5971171e646d7e09d1",
         intel: "d8e3455ef15f344827cbc10b1b20b9b4288127be1ef1aaa63970c2bd6f642e5b"

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
