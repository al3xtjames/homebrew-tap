cask "mpv@nightly" do
  version "0.41.0-dev-g13a3e3ad0"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/26593436965/mpv-v0.41.0-dev-g13a3e3ad0-26593436965-macos-15-arm.zip"
    sha256 "725f3b2a42c737b240cf403e3a218c9ea9783b06bc670d397c082ea4d7804188"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/26593436965/mpv-v0.41.0-dev-g13a3e3ad0-26593436965-macos-15-intel.zip"
    sha256 "14dfc9f97c972afc9d1b7ba82808858ac83369ca51b356a5ace3bc4a856e399b"
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
