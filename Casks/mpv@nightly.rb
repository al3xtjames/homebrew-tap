cask "mpv@nightly" do
  version "0.41.0-dev-g6a262d11f"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/39135297726/mpv-v0.41.0-dev-g6a262d11f-39135297726-macos-15-arm.zip"
    sha256 "ee5d2af54b2a7a977a657e4bcd9637d8636ccc91f591a12c5d127fac7b40aee1"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/39135297726/mpv-v0.41.0-dev-g6a262d11f-39135297726-macos-15-intel.zip"
    sha256 "b5fc1834d97da9b473c00ecab377850d7c5241884db8e984672a7bfb6291bc39"
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
