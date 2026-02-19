cask "mpv@nightly" do
  version "0.41.0-dev-gc2c081f49"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/22149858545/mpv-v0.41.0-dev-gc2c081f49-22149858545-macos-15-arm.zip"
    sha256 "4c8dcdca8831247ecad200efd3084720d881403bbf7e9360c4aca46e9dbd690a"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/22149858545/mpv-v0.41.0-dev-gc2c081f49-22149858545-macos-15-intel.zip"
    sha256 "baca0641334a0556b737f52318bd602dc6c1dd329b2a8e012e93e69d115c9f34"
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
