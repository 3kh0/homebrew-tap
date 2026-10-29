cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.143"
  sha256 arm:   "dd4909a5490304733951acceac958da0ef449c3131e91d907ef1a811fe7086cb",
         intel: "e72d763fa8b0868de79322422d073ece340e0e05d12d010dcc8dc7e44d4ac882"

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
