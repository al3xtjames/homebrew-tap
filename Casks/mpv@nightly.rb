cask "mpv@nightly" do
  version "0.41.0-dev-gf7ad4a5f8"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/22194362210/mpv-v0.41.0-dev-gf7ad4a5f8-22194362210-macos-15-arm.zip"
    sha256 "e8b4b799954b911b0b91a38d4932bbe3db1bcadbbe0ada12ddc603cf05c45786"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/22194362210/mpv-v0.41.0-dev-gf7ad4a5f8-22194362210-macos-15-intel.zip"
    sha256 "7909cc8deef6a60b11728dbf1807e1bf8976058c3c921d580ffc67af0939d54f"
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
