cask "mpv@nightly" do
  version "0.41.0-dev-g174b638f2"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/33547610191/mpv-v0.41.0-dev-g174b638f2-33547610191-macos-15-arm.zip"
    sha256 "f390c768a61b9449e6c41a8a1e3c442ace7bd2f16c165cdf560cb4cdf73c86aa"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/33547610191/mpv-v0.41.0-dev-g174b638f2-33547610191-macos-15-intel.zip"
    sha256 "02285aa3443d6d68bbc781982e1eaf8a01864427280c94bf68d7be9f7e4b0efb"
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
