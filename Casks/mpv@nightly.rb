cask "mpv@nightly" do
  version "0.40.0-dev-g0a606d9e1"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/18997589124/mpv-macos-14-arm.zip"
    sha256 "b0162dc6ec8b5b6447f56908b098f8841f44dcdf45f2c58468a2106ed279b628"
    depends_on macos: ">= :sonoma"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/18997589124/mpv-macos-13-intel.zip"
    sha256 "3a4875379b47ae894b887de0b92436bccb2abe82621cf7d1deaa4a87a8716eee"
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
