cask "mpv@nightly" do
  version "0.41.0-dev-g4498c0ff8"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/25889771012/mpv-v0.41.0-dev-g4498c0ff8-25889771012-macos-15-arm.zip"
    sha256 "37f54c8c565289725c2d15d3640dd9de9ea09f0b342e46cd238b7c21e2c5f1da"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/25889771012/mpv-v0.41.0-dev-g4498c0ff8-25889771012-macos-15-intel.zip"
    sha256 "931d9308ded435ae8d4bd1704c74c25818b9811d1ee39a3eeb0858e6e3e9722c"
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
