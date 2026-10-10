cask "mpv@nightly" do
  version "0.41.0-dev-gb2c255c13"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/37956197985/mpv-v0.41.0-dev-gb2c255c13-37956197985-macos-15-arm.zip"
    sha256 "cf38f41a98163a3ae896f684d0adba00be796236a4a95be4f44e786e12a37766"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/37956197985/mpv-v0.41.0-dev-gb2c255c13-37956197985-macos-15-intel.zip"
    sha256 "63cadfcd096f191a7f04905a777913b28141d9b561e39385a06cb856e752c89d"
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
