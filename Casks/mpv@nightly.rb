cask "mpv@nightly" do
  version "0.41.0-dev-gbaa3e11d4"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/40141553607/mpv-v0.41.0-dev-gbaa3e11d4-40141553607-macos-15-arm.zip"
    sha256 "b996aeec2eb3c228838a6d41317b6a7f8b445939771ecfc7d5902b3040c274fd"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/40141553607/mpv-v0.41.0-dev-gbaa3e11d4-40141553607-macos-15-intel.zip"
    sha256 "3d21b2837d92794bbad927bd3bead2a28871038e5a2f0697f5955fc8b185aa74"
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
