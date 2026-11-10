cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.155"
  sha256 arm:   "e652a2a0adb92f8d86187e871ace6a69b285fc900c4c70a01d8d8497bcda9a37",
         intel: "ae6bab437fc335c748298967c972eddb1e6480bd1e2de46dcdad6c56d65c5b9d"

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
