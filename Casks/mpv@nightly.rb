cask "mpv@nightly" do
  version "0.41.0-dev-g7e4cb538a"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/34183870349/mpv-v0.41.0-dev-g7e4cb538a-34183870349-macos-15-arm.zip"
    sha256 "d4e94d89a7dec5303944ba412a14dd2ce578d6d2f2004699d71eddfd651217d5"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/34183870349/mpv-v0.41.0-dev-g7e4cb538a-34183870349-macos-15-intel.zip"
    sha256 "92fedb55559746d8c9d1af91c9a817169499d033768dec6c0f327e66576ca938"
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
