cask "mpv@nightly" do
  version "0.41.0-dev-gcfd818bca"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/25394183412/mpv-v0.41.0-dev-gcfd818bca-25394183412-macos-15-arm.zip"
    sha256 "abf65d2adde9e1f135d6ad03e78d7f5aa2912b119f2fa483f9cd1d234fc70d52"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/25394183412/mpv-v0.41.0-dev-gcfd818bca-25394183412-macos-15-intel.zip"
    sha256 "768701f7542a293040726e819651527ee18087e7dc5b869d7715a2c33d85d780"
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
