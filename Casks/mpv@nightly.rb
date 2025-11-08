cask "mpv@nightly" do
  version "0.40.0-dev-gbbafb7488"
  depends_on macos: ">= :sequoia"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/19155488612/mpv-macos-15-arm.zip"
    sha256 "9b2d55143fd2d4085930d77b2bec9fb662211b535208e2c6605de270ee907be5"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/19155488612/mpv-macos-15-intel.zip"
    sha256 "f410eabb6cefd26fcbe6321f57070c49c48c74d8178025fdbff4b9ca5c86be0b"
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
