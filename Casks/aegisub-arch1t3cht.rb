cask "aegisub-arch1t3cht" do
  version "migration03-02"
  depends_on macos: :sequoia

  on_arm do
    url "https://github.com/arch1t3cht/Aegisub/releases/download/#{version}/macOS.arm64.Release.-.installer.zip"
    sha256 "decf40001eb4fc533395371c37c0ac6552471f1f9cfcb43893c15136eed58d13"
  end

  on_intel do
    url "https://github.com/arch1t3cht/Aegisub/releases/download/#{version}/macOS.x86_64.Release.-.installer.zip"
    sha256 "20ca893b48b48d6c02aaca1a7804743e354cb7ded6fde98c726c867dd51b66f1"
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
