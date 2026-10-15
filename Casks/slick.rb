cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.133"
  sha256 arm:   "d48fb3b96cccbae4ba706adc9b8b7b306798566e3d96184ddb61d7eefcd22773",
         intel: "9dea65835e227130d3a42e5c34268c6f26a7221644c62bee82b9dfe496d06234"

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
