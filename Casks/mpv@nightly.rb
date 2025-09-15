cask "mpv@nightly" do
  version "0.40.0-dev-gd837c4365"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/17651871694/mpv-macos-14-arm.zip"
    sha256 "886306236e216cbda4b9e6d0d05df9fc215fd82adb4e43bb7d1ec0650836b9e6"
    depends_on macos: ">= :sonoma"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/17651871694/mpv-macos-13-intel.zip"
    sha256 "cd9dd73d5ff0cc189623e8a381b88b8a139017a752ba75fcf2bdda0f9dcf3ff1"
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
