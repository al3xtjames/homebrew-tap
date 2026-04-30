cask "mpv@nightly" do
  version "0.41.0-dev-g5ebe9581d"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/25123627240/mpv-v0.41.0-dev-g5ebe9581d-25123627240-macos-15-arm.zip"
    sha256 "e049fcc12be1656e199d341a403e0db95d96b28d4127c6765d3e8d62ca355d32"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/25123627240/mpv-v0.41.0-dev-g5ebe9581d-25123627240-macos-15-intel.zip"
    sha256 "2c274d10fa3569d3c24f842b10b439d0909a400b4b0a837e77a427bf3b15d2d8"
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
