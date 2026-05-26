cask "gatewayhub" do
  version "0.1.3-beta.4"
  sha256 "3316271e1a3f25b96d87238a7578730d9ee282e6a152a846c032f94903143e75"

  url "https://github.com/bee1an/GatewayHub/releases/download/v#{version}/gatewayhub-#{version}.dmg"
  name "GatewayHub"
  desc "Local multi-provider AI gateway hub with Kiro account pool"
  homepage "https://github.com/bee1an/GatewayHub"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: ">= :big_sur"

  app "GatewayHub.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/GatewayHub.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/GatewayHub",
    "~/Library/Logs/GatewayHub",
    "~/Library/Preferences/dev.gatewayhub.app.plist",
    "~/Library/Saved Application State/dev.gatewayhub.app.savedState",
  ]
end
