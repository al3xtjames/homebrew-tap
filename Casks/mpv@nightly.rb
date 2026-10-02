cask "mpv@nightly" do
  version "0.41.0-dev-g3186d369f"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/36640398222/mpv-v0.41.0-dev-g3186d369f-36640398222-macos-15-arm.zip"
    sha256 "2506739a47b46da45224506b8ef0702fedfd7cec98e7bad2304b0e749897e7d1"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/36640398222/mpv-v0.41.0-dev-g3186d369f-36640398222-macos-15-intel.zip"
    sha256 "4bbf2edbb76f805b2d0fdf1520d1f3c5f57e7a345585b7a795bd7e398cfb0e1b"
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
