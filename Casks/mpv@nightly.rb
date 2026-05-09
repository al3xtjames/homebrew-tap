cask "mpv@nightly" do
  version "0.41.0-dev-g003c5433f"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/25612915716/mpv-v0.41.0-dev-g003c5433f-25612915716-macos-15-arm.zip"
    sha256 "32a4b4e16a837cc6f7af16feb8ab1126af57bb8ebb6eddd7f9bcf7750f5d6d46"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/25612915716/mpv-v0.41.0-dev-g003c5433f-25612915716-macos-15-intel.zip"
    sha256 "211fe8e8064b910e1b5a1751b0c4bdbde1ede964d7b761dec950a1d9fbc1384e"
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
