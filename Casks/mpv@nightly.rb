cask "mpv@nightly" do
  version "0.41.0-dev-g1d1568614"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/30645369667/mpv-v0.41.0-dev-g1d1568614-30645369667-macos-15-arm.zip"
    sha256 "a04713e07732686dd152e0fa752dbb82438c81d9b375a917ef936f0aa7cd912d"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/30645369667/mpv-v0.41.0-dev-g1d1568614-30645369667-macos-15-intel.zip"
    sha256 "5fcd66e7143766c08b415d6c09755f1a11348cd40c54596657cde98a36ef1d9b"
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
