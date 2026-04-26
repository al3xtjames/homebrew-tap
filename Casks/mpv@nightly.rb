cask "mpv@nightly" do
  version "0.41.0-dev-g05b327c72"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/24950624123/mpv-v0.41.0-dev-g05b327c72-24950624123-macos-15-arm.zip"
    sha256 "414d5f898de58e02ff59ad0e29e3fba39b0e58a558352b5593d0f23bb3732c9d"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/24950624123/mpv-v0.41.0-dev-g05b327c72-24950624123-macos-15-intel.zip"
    sha256 "1d15b48655b11bb350195ea3a557d60e7f027d2f41db5cdfc8b4305abbb04ad9"
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
