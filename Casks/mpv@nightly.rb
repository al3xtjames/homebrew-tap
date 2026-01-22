cask "mpv@nightly" do
  version "0.41.0-dev-g6e54aa328"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/21229078570/mpv-v0.41.0-dev-g6e54aa328-21229078570-macos-15-arm.zip"
    sha256 "d7b5784ac736882fdf77a4e0c7b06c48771cfe67733e6b5bf74485135896a77e"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/21229078570/mpv-v0.41.0-dev-g6e54aa328-21229078570-macos-15-intel.zip"
    sha256 "62f0b92c5c9697bbc0a776281a0a5b70dd389bbde2534206cfa9625b0b28c598"
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
