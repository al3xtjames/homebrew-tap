cask "mpv@nightly" do
  version "0.41.0-dev-gaa8221372"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/22038346825/mpv-v0.41.0-dev-gaa8221372-22038346825-macos-15-arm.zip"
    sha256 "1454041854d7bf601aa5bda691b65c19fe96dce06a0eab4a9625d082e25a1ed8"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/22038346825/mpv-v0.41.0-dev-gaa8221372-22038346825-macos-15-intel.zip"
    sha256 "6a64b79b3fb4768d6cd9f6638d6a23111b4c91ab8b863d0c2befd27f89506fb5"
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
