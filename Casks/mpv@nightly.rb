cask "mpv@nightly" do
  version "0.41.0-dev-g48e6c35c0"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/30210003212/mpv-v0.41.0-dev-g48e6c35c0-30210003212-macos-15-arm.zip"
    sha256 "783ab88e9acb548e2c1ee4eaa4e01cb84a68ba12b80e18212e6f6b7f27c0480a"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/30210003212/mpv-v0.41.0-dev-g48e6c35c0-30210003212-macos-15-intel.zip"
    sha256 "b57d6cc265db61c15f9d37aaf8173e5276e6317271b9dfe121630f11cea599bf"
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
