cask "mpv@nightly" do
  version "0.41.0-dev-gc79888416"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/23390236968/mpv-v0.41.0-dev-gc79888416-23390236968-macos-15-arm.zip"
    sha256 "dd5d9db3806cee3b45fa1ca740b5f10a2aecd15afe709481cb6d1608b1554fcf"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/23390236968/mpv-v0.41.0-dev-gc79888416-23390236968-macos-15-intel.zip"
    sha256 "977c61425be45fda698368296ced75cf457d326619775821e9a058e82c1ee796"
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
