cask "mpv@nightly" do
  version "0.41.0-dev-g9483d6e12"
  depends_on macos: ">= :sequoia"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20870813220/mpv-v0.41.0-dev-g9483d6e12-20870813220-macos-15-arm.zip"
    sha256 "63f31b3b7216c30b54ff175046185e78946caef921cd86a37fba01f7ad9b9ad9"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20870813220/mpv-v0.41.0-dev-g9483d6e12-20870813220-macos-15-intel.zip"
    sha256 "044986c920917f4bab13904d966079b25827f7d98b5ba3b18f8adef8cf8bc5cc"
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
