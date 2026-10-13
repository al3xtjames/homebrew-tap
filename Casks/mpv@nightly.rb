cask "mpv@nightly" do
  version "0.41.0-dev-gc3ac7f395"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/38326895870/mpv-v0.41.0-dev-gc3ac7f395-38326895870-macos-15-arm.zip"
    sha256 "0a81aa16d8a9d4a77a40036b8c33e3510886f1d880d20111d24c92834e00384c"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/38326895870/mpv-v0.41.0-dev-gc3ac7f395-38326895870-macos-15-intel.zip"
    sha256 "77d0039aa10902a215af97b620a14a6c0d6426449af84aa99932e02af6f01b97"
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
