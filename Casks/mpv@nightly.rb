cask "mpv@nightly" do
  version "0.41.0-dev-g6fd80b200"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/35790898131/mpv-v0.41.0-dev-g6fd80b200-35790898131-macos-15-arm.zip"
    sha256 "94ce19b1d56040b864e5c804cc8cde6c632b15fa3b23c438546ccb385a0adffc"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/35790898131/mpv-v0.41.0-dev-g6fd80b200-35790898131-macos-15-intel.zip"
    sha256 "06cc7ba459d55647613fc5aa0c0e13874e6d7793577a4f497bf21306ebc011ee"
  end

  name "mpv"
  desc "Media player based on MPlayer and mplayer2"
  homepage "https://mpv.io/"

  conflicts_with cask: "mpv"
  depends_on macos: :sequoia

  app "mpv.app"
  command_wrapper "mpv", executable: "#{appdir}/mpv.app/Contents/MacOS/mpv"

  uninstall quit: "io.mpv"

  zap trash: [
    "~/.config/mpv",
    "~/Library/Logs/mpv.log",
    "~/Library/Preferences/io.mpv.plist",
    "~/Library/Preferences/mpv.plist",
  ]
end
