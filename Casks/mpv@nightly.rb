cask "mpv@nightly" do
  version "0.41.0-dev-g2ad46a3c3"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/23669938790/mpv-v0.41.0-dev-g2ad46a3c3-23669938790-macos-15-arm.zip"
    sha256 "5cc6eee29edf7612d9d8181d67b3e2a95c4a4ba1cadff5666ae1cd195d93e114"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/23669938790/mpv-v0.41.0-dev-g2ad46a3c3-23669938790-macos-15-intel.zip"
    sha256 "bbca9c67120c60c792a5db18d8aba8dbbcf3c56e028cfdc27df0be9be16868da"
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
