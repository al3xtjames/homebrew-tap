cask "mpv@nightly" do
  version "0.41.0-dev-g01e2533f3"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/39050261656/mpv-v0.41.0-dev-g01e2533f3-39050261656-macos-15-arm.zip"
    sha256 "c8baa91a6ef334e9491acd34220ad11da40739decd270d9e70b3e893d0e9dc5a"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/39050261656/mpv-v0.41.0-dev-g01e2533f3-39050261656-macos-15-intel.zip"
    sha256 "24724dcd441688b80b5829e7c23d45f83d231becaf31b7a30060d92a817b1f96"
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
