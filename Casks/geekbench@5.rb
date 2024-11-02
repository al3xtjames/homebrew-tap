cask "geekbench@5" do
  version "5.5.1"
  sha256 "04b06cb642e51230a3dfd07ce2d3a4ea696cb349583737622749174dc8747313"
  depends_on macos: ">= :high_sierra"

  url "https://cdn.geekbench.com/Geekbench-#{version}-Mac.zip"
  name "Geekbench"
  desc "Tool to measure the computer system's performance"
  homepage "https://www.geekbench.com/"

  auto_updates true

  app "Geekbench #{version.major}.app"

  zap trash: [
    "~/Library/Caches/com.primatelabs.Geekbench#{version.major}",
    "~/Library/Preferences/com.primatelabs.Geekbench#{version.major}.plist",
    "~/Library/Saved Application State/com.primeatelabs.Geekbench#{version.major}.savedState",
  ]
end
