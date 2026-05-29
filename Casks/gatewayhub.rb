cask "gatewayhub" do
  version "0.2.0"
  sha256 "eeba7bf0918a2c71f5a7ad4633e25c5ebaefb98cccf767755dada5f791f34ffb"

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
