cask "mpv@nightly" do
  version "0.42.0-dev-g649001d4e"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/43517371464/mpv-v0.42.0-dev-g649001d4e-43517371464-macos-15-arm.zip"
    sha256 "ec4106505cbbc3ac861f6f59c6adcd1911a549e67aa1ca83695c72bed02b644b"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/43517371464/mpv-v0.42.0-dev-g649001d4e-43517371464-macos-15-intel.zip"
    sha256 "6b17dcfb331559317e921c26c4de691690ac71a1909a12d3175da9502343d1df"
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
