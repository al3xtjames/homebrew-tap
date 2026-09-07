cask "mpv@nightly" do
  version "0.41.0-dev-g989d32716"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/34070939881/mpv-v0.41.0-dev-g989d32716-34070939881-macos-15-arm.zip"
    sha256 "b4e2de46d2bb30c6a4f0602fc6d89fc464bff47ea5122e0c1428669903d2b8e2"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/34070939881/mpv-v0.41.0-dev-g989d32716-34070939881-macos-15-intel.zip"
    sha256 "0655abdd20751d76f97c24b3750e22e8c3151a60fa88a1555bdf5795c6d116c9"
  end

  name "mpv"
  desc "Media player based on MPlayer and mplayer2"
  homepage "https://mpv.io/"

  conflicts_with cask: "mpv"
  depends_on macos: :sequoia

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
