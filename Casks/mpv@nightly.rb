cask "mpv@nightly" do
  version "0.41.0-dev-gc0d989c83"
  depends_on macos: ">= :sequoia"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20491454484/mpv-macos-15-arm.zip"
    sha256 "05031e842d1c6bb868d3e98f277fe10dbeb5eb2da8eaf4c8b441253bc21f5ab7"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20491454484/mpv-macos-15-intel.zip"
    sha256 "5936d26415ed741dd234eae9a8d46f59b2994c24cddb3aaf7a2d4231516a69f3"
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
