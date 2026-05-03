cask "mpv@nightly" do
  version "0.41.0-dev-gd8be86067"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/25270128488/mpv-v0.41.0-dev-gd8be86067-25270128488-macos-15-arm.zip"
    sha256 "5f7d726da28b5608a5a9e1ecdba48291e010c376633ac85b695b8d3c13b92062"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/25270128488/mpv-v0.41.0-dev-gd8be86067-25270128488-macos-15-intel.zip"
    sha256 "c1c6341a8d85a8d9a6e4ee04ff77afbfaf10bde565c0c9e1be98bc38a6dfd680"
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
