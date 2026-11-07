cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.153"
  sha256 arm:   "ab0fa59b9389cc140839e2199ea1735cf562caf25762f408dc0c605c2f2cb801",
         intel: "cdddc8204ef7880fb6d6dc36ff0966aa24a5f7e8d6c74e1a08f73ac260550d43"

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
