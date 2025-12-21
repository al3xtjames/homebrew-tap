cask "mpv@nightly" do
  version "0.41.0-dev-gd0e24ab17"
  depends_on macos: ">= :sequoia"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20414556158/mpv-macos-15-arm.zip"
    sha256 "0abe970c36a8dded618a119a2a538f288b353a533d8f66d3105da5b08bd1d877"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20414556158/mpv-macos-15-intel.zip"
    sha256 "a8f143289646d122869e6f453f66c5db5f5c81ed71167a984b960df7514e3c3d"
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
