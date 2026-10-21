cask "slick" do
  arch arm: "arm64", intel: "x64"

  version "2.0.139"
  sha256 arm:   "427a0e75df041a4547ba2efdd37275133ab2b338937b1e0f71182d42e7f12505",
         intel: "d0fadbf94978ba9d38cbd75429ecfbefad5f8a31bbfc4487575315ff2800a4ed"

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
