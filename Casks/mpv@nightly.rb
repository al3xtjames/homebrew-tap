cask "mpv@nightly" do
  version "0.41.0-dev-g2007f5543"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20978304864/mpv-v0.41.0-dev-g2007f5543-20978304864-macos-15-arm.zip"
    sha256 "18711eb244d86073fff49d26fe6b6d5c5a63cd8aa9579867525111b676951195"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20978304864/mpv-v0.41.0-dev-g2007f5543-20978304864-macos-15-intel.zip"
    sha256 "4dcd6ee737f9e1ac5313dd8c3a7713bacf6141da0aad7ed209808ed0a9a557a9"
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
