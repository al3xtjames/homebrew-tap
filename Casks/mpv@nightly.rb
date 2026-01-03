cask "mpv@nightly" do
  version "0.41.0-dev-ga3350e2fb"
  depends_on macos: ">= :sequoia"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20664713109/mpv-v0.41.0-dev-ga3350e2fb-20664713109-macos-15-arm.zip"
    sha256 "cd20e77a5e2804f2cc51abccbd63304067b6f384fb393e4b78846d8344ac831c"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20664713109/mpv-v0.41.0-dev-ga3350e2fb-20664713109-macos-15-intel.zip"
    sha256 "e815893b5e40f7dbd3fb772c1b3ba4c2c9c2e20484271fbed619f6ed9a37b150"
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
