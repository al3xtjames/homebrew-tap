cask "mpv@nightly" do
  version "0.40.0-dev-g17a3ac4cf"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/18237619571/mpv-macos-14-arm.zip"
    sha256 "80d95daa0dde926ae0ad78b933b5012d71b613fb4489a8a93397bf3213258ee1"
    depends_on macos: ">= :sonoma"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/18237619571/mpv-macos-13-intel.zip"
    sha256 "d91fc6054a43c147d0f294be533fbc5c26dd7793dd6bcd0639a03be1890f09a5"
    depends_on macos: ">= :ventura"
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
