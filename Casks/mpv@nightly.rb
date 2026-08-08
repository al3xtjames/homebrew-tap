cask "mpv@nightly" do
  version "0.41.0-dev-gdd5d17d32"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/31216981724/mpv-v0.41.0-dev-gdd5d17d32-31216981724-macos-15-arm.zip"
    sha256 "9ee63f944a1a1be4f65084be3cf119da27ebabd5921b1102fa1319201c0ac4ba"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/31216981724/mpv-v0.41.0-dev-gdd5d17d32-31216981724-macos-15-intel.zip"
    sha256 "e4378d946613e9670d936bd7a6937947e6d269d9a832d8d69b60d6ae507c1b91"
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
