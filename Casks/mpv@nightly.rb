cask "mpv@nightly" do
  version "0.41.0-dev-ge470f8986"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/36346558182/mpv-v0.41.0-dev-ge470f8986-36346558182-macos-15-arm.zip"
    sha256 "56efabf42c5c60b9253f3dd7b7ce9712819dbb2b58408a92b56b8356fe5bff4d"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/36346558182/mpv-v0.41.0-dev-ge470f8986-36346558182-macos-15-intel.zip"
    sha256 "fb037794e2443b4b1826e32aa0a4f20882bab57c09aa99469f938fc24f253db0"
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
