cask "aegisub-arch1t3cht" do
  version "migration02-01"
  depends_on macos: ">= :sequoia"

  on_arm do
    url "https://github.com/arch1t3cht/Aegisub/releases/download/migration02-01/macOS.arm64.Release.-.installer.zip"
    sha256 "2487566e3b1aec275c87bc549063406f1adfaab3cd069eb3a6fcaa76916f6348"
  end

  on_intel do
    url "https://github.com/arch1t3cht/Aegisub/releases/download/migration02-01/macOS.x86_64.Release.-.installer.zip"
    sha256 "9aed3f4181c0f82a366bb224ab94bf074ea73cab863f85b51cf3ca59c088bc91"
  end

  name "Aegisub"
  desc "Create and modify subtitles"
  homepage "https://aegisub.org/"

  app "Aegisub.app"

  uninstall quit: "com.aegisub.aegisub"

  zap trash: [
    "~/Library/Application Support/Aegisub",
    "~/Library/Preferences/com.aegisub.aegisub.plist",
    "~/Library/Saved Application State/com.aegisub.aegisub.savedState",
  ]
end
