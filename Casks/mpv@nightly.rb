cask "mpv@nightly" do
  version "0.41.0-dev-g0b7ed670f"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/34806151888/mpv-v0.41.0-dev-g0b7ed670f-34806151888-macos-15-arm.zip"
    sha256 "882bed62d475336c617074aea84a60c30d89daee1c581186bdea466b58a9f4e4"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/34806151888/mpv-v0.41.0-dev-g0b7ed670f-34806151888-macos-15-intel.zip"
    sha256 "e7485aff5b7da1dbba2bbfd6a5b899e220a840808072b62a251f9768d6c53f89"
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
