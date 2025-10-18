cask "mpv@nightly" do
  version "0.40.0-dev-g233e89698"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/18541049820/mpv-macos-14-arm.zip"
    sha256 "d10af7040ed7d6be1443ff9612c6c2d218f6cce80f0eba7ce92ff95b7bbef043"
    depends_on macos: ">= :sonoma"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/18541049820/mpv-macos-13-intel.zip"
    sha256 "0b36aa8efba283c299f4cc76bdcde239bb927be1254193c405d02e69718950c7"
    depends_on macos: ">= :ventura"
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
