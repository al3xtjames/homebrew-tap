cask "mpv@nightly" do
  version "0.41.0-dev-g13a4bfbc1"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/34760359211/mpv-v0.41.0-dev-g13a4bfbc1-34760359211-macos-15-arm.zip"
    sha256 "0c01b338286abcc103a783260d0b3ab35940325cb8a27ce1dcd8d243fd554944"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/34760359211/mpv-v0.41.0-dev-g13a4bfbc1-34760359211-macos-15-intel.zip"
    sha256 "0436dad6b79f64a7ad67205d3b3041ef4e1403a41bb6ba79ac39fcfa5c61f607"
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
