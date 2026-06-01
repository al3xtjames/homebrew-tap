cask "mpv@nightly" do
  version "0.41.0-dev-gf5d4d9b02"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/26762705141/mpv-v0.41.0-dev-gf5d4d9b02-26762705141-macos-15-arm.zip"
    sha256 "5c665d678cd1aa7f9c6b5b44df1be3aeeebb75e71a8f7c7cf9ac38c46854862d"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/26762705141/mpv-v0.41.0-dev-gf5d4d9b02-26762705141-macos-15-intel.zip"
    sha256 "00422f7a9060b71769bbb4b40600ff843755507eef4cefdde986d30cba304e88"
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
