cask "mpv@nightly" do
  version "0.41.0-dev-g9e06c3248"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/26303439996/mpv-v0.41.0-dev-g9e06c3248-26303439996-macos-15-arm.zip"
    sha256 "c298f15f66229d08e1258fac1a80388151917f3b2a46275da6a5ed2b39151754"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/26303439996/mpv-v0.41.0-dev-g9e06c3248-26303439996-macos-15-intel.zip"
    sha256 "156d22588565cb0ff1ea31fcfec575185c4d0fb9ded6b20687248f7ad1ec2d30"
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
