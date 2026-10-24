cask "mpv@nightly" do
  version "0.41.0-dev-g703e59b0e"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/40117195812/mpv-v0.41.0-dev-g703e59b0e-40117195812-macos-15-arm.zip"
    sha256 "a1d8991f406c8478de24662bf3354ff2ecb3b69ef235c09a2bfcf3e9091a1313"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/40117195812/mpv-v0.41.0-dev-g703e59b0e-40117195812-macos-15-intel.zip"
    sha256 "bccd35c6fded8ad5f9e838218a9288bd384769565be1efa2f321086f65115a0e"
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
