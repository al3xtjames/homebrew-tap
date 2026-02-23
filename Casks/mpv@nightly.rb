cask "mpv@nightly" do
  version "0.41.0-dev-gf439c7f62"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/22285767466/mpv-v0.41.0-dev-gf439c7f62-22285767466-macos-15-arm.zip"
    sha256 "9807f42cc8e9dfd4da45e0f7e0fff745a56893e6f51225dad039bf2134d48cc7"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/22285767466/mpv-v0.41.0-dev-gf439c7f62-22285767466-macos-15-intel.zip"
    sha256 "e931a81d8e54a1ac522db78662cc06bb8bac5ed11c3413f053cce01989daebb6"
  end

  name "mpv"
  desc "Media player based on MPlayer and mplayer2"
  homepage "https://mpv.io/"

  conflicts_with cask: "mpv"
  depends_on macos: ">= :sequoia"

  app "mpv.app"
  # shim script (https://github.com/Homebrew/homebrew-cask/issues/18809)
  shimscript = "#{staged_path}/mpv.wrapper.sh"
  binary shimscript, target: "mpv"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/sh
      exec '#{appdir}/mpv.app/Contents/MacOS/mpv' "$@"
    EOS
  end

  uninstall quit: "io.mpv"

  zap trash: [
    "~/.config/mpv",
    "~/Library/Logs/mpv.log",
    "~/Library/Preferences/io.mpv.plist",
    "~/Library/Preferences/mpv.plist",
  ]
end
