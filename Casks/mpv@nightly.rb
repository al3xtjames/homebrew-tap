cask "mpv@nightly" do
  version "0.41.0-dev-g4ecf7293f"
  depends_on macos: ">= :sequoia"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20552226831/mpv-macos-15-arm.zip"
    sha256 "468bb986fa26cba15ecb25210fa3ab78c98bafb07a0ad3116b1ecee5d0691b90"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20552226831/mpv-macos-15-intel.zip"
    sha256 "9d6dfe2fa200d05f06192879a20c76332e712f23bbbe8bcb5bf1da1ed6ceae60"
  end

  name "mpv"
  desc "Media player based on MPlayer and mplayer2"
  homepage "https://mpv.io/"

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

  zap trash: [
    "~/.config/mpv",
    "~/Library/Logs/mpv.log",
    "~/Library/Preferences/io.mpv.plist",
    "~/Library/Preferences/mpv.plist",
  ]
end
