cask "mpv@nightly" do
  version "0.41.0-dev-g5cc1094ad"
  depends_on macos: ">= :sequoia"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20600623295/mpv-macos-15-arm.zip"
    sha256 "fe4b0fa1765ba392c908963628fb79219b8a5b2f041fbf1c8d79bfa0fb682bef"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20600623295/mpv-macos-15-intel.zip"
    sha256 "0813df6d021d424e0551154902d41d79be55d6ee16bdfe3e904ab63e9de1571b"
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
