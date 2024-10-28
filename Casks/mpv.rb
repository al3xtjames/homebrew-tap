cask "mpv" do
  version "0.39.0"

  on_arm do
    url "https://web.archive.org/web/20240926120208/https://nightly.link/mpv-player/mpv/actions/runs/10999492923/mpv-macos-14-arm.zip"
    sha256 "c2724fc11b0db2b01016e08d180250d0b9398fbbe18a59cf75bbe88bad696b0e"
    depends_on macos: ">= :sonoma"
  end

  on_intel do
    url "https://web.archive.org/web/20240926130345/https://nightly.link/mpv-player/mpv/actions/runs/10999492923/mpv-macos-13-intel.zip"
    sha256 "f5235dfb13a7bee1b92e2875edc1263f0c37d23c95c353e86276a4f85fceb326"
    depends_on macos: ">= :ventura"
  end

  name "mpv"
  desc "Media player based on MPlayer and mplayer2"
  homepage "https://mpv.io/"

  conflicts_with formula: "mpv"

  app "mpv.app"
  binary "#{appdir}/mpv.app/Contents/MacOS/mpv"

  zap trash: [
    "~/.config/mpv",
    "~/Library/Logs/mpv.log",
    "~/Library/Preferences/io.mpv.plist",
    "~/Library/Preferences/mpv.plist",
  ]
end
