cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.125"
  sha256 arm:   "234ce0d3e6b16c216c29574a86c1840a7d85a4164924aed3941f1dc0e32f27f3",
         intel: "144e41fd32926bf53ee57789d9ac19fa63e77d3d3e4d94319cd17452c5b3e26c"

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
