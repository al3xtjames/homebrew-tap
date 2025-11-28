cask "mpv@nightly" do
  version "0.40.0-dev-gb6c35b55a"
  depends_on macos: ">= :sequoia"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/19714976727/mpv-macos-15-arm.zip"
    sha256 "438c3db65c3d3e9c66d27f9eb26929290bfdb10782205ded5727cb5dc2d42286"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/19714976727/mpv-macos-15-intel.zip"
    sha256 "d7d8d689da1143b611d3d033bac824e725254ace1c194b991abab5c9d1fa9c70"
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
