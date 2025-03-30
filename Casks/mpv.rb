cask "mpv" do
  version "0.40.0"

  on_arm do
    url "https://web.archive.org/web/20250330220503/https://nightly.link/mpv-player/mpv/actions/runs/14066361747/mpv-macos-14-arm.zip"
    sha256 "b02dc997eb2c88c87b2f76489636e7c7eb90ae8754879106e76a5cd8129f24b9"
    depends_on macos: ">= :sonoma"
  end

  on_intel do
    url "https://web.archive.org/web/20250330220356/https://nightly.link/mpv-player/mpv/actions/runs/14066361747/mpv-macos-13-intel.zip"
    sha256 "ad8bfa7df4591958cf7f35996e5fe3c59f5ac4b4cee5d94e36e2344b11cd4a5a"
    depends_on macos: ">= :ventura"
  end

  name "mpv"
  desc "Media player based on MPlayer and mplayer2"
  homepage "https://mpv.io/"

  conflicts_with formula: "mpv"

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
