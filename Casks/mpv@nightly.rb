cask "mpv@nightly" do
  version "0.41.0-dev-gf4d13e1c2"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/31356187173/mpv-v0.41.0-dev-gf4d13e1c2-31356187173-macos-15-arm.zip"
    sha256 "71c5529536d83caae4ea4142e2d9b293a58c3de53a95a8adafb0e4442a44067f"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/31356187173/mpv-v0.41.0-dev-gf4d13e1c2-31356187173-macos-15-intel.zip"
    sha256 "88447e7a583dff2b5ae3c215e11692d89a1ac51b0d213799905e8a3c18365c8c"
  end

  name "mpv"
  desc "Media player based on MPlayer and mplayer2"
  homepage "https://mpv.io/"

  conflicts_with cask: "mpv"
  depends_on macos: :sequoia

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
