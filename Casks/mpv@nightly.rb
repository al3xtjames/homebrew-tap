cask "mpv@nightly" do
  version "0.41.0-dev-g8665237a0"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/24608339878/mpv-v0.41.0-dev-g8665237a0-24608339878-macos-15-arm.zip"
    sha256 "89884c581ce2ac87cfa73853ccdf8c441853e241d13c7a0aa9b2408a4d0663c4"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/24608339878/mpv-v0.41.0-dev-g8665237a0-24608339878-macos-15-intel.zip"
    sha256 "294d351305024445ae8e23d00aed5b288fea0768bd936780a8e1407fbd87d430"
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
