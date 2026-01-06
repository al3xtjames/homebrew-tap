cask "mpv@nightly" do
  version "0.41.0-dev-g0035bb7cb"
  depends_on macos: ">= :sequoia"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20698926841/mpv-v0.41.0-dev-g0035bb7cb-20698926841-macos-15-arm.zip"
    sha256 "1163443921982132b745e096ab857dd958e183bca7edd2d0fd130d0494e4a8c3"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20698926841/mpv-v0.41.0-dev-g0035bb7cb-20698926841-macos-15-intel.zip"
    sha256 "5075b52bb3a74d3dab93bbf6896ae503d29e31062cd8958e3d59413757915af0"
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
