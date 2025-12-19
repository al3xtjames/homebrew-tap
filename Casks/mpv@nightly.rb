cask "mpv@nightly" do
  version "0.40.0-dev-g5d89f15e9"
  depends_on macos: ">= :sequoia"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20208126880/mpv-macos-15-arm.zip"
    sha256 "f57b0c967bc6cf14fc79110bdadc8f6ef4b3e545d9e7bd20e89ba3214d1861d8"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20208126880/mpv-macos-15-intel.zip"
    sha256 "a36246f4796eacfba7385d667b849a150b94539144cc6bffdba865062247ad9e"
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
