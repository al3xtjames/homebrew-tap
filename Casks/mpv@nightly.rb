cask "mpv@nightly" do
  version "0.41.0-dev-gd54bad563"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/22403911310/mpv-v0.41.0-dev-gd54bad563-22403911310-macos-15-arm.zip"
    sha256 "a95efbd1813d67ddf1d8cc14728c4715a751ec74fd10e28f85ad55c032fe6d61"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/22403911310/mpv-v0.41.0-dev-gd54bad563-22403911310-macos-15-intel.zip"
    sha256 "61f67a34782532e46e1f43d267cb2d1672248064e07a02bcdf03ffce6d3d7c1d"
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
