cask "mpv@nightly" do
  version "0.41.0-dev-g428edff9c"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/23954228442/mpv-v0.41.0-dev-g428edff9c-23954228442-macos-15-arm.zip"
    sha256 "25144717881a8ea14e82a88e58871315e3d29e50eea02a958da4f7a0d41a131f"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/23954228442/mpv-v0.41.0-dev-g428edff9c-23954228442-macos-15-intel.zip"
    sha256 "04aba6fcfb052ba526b98ddcc3fdc3a63f5105a3f6b2e735c57b6d94b49eb98f"
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
