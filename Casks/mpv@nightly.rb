cask "mpv@nightly" do
  version "0.41.0-dev-ge5486b96d"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/29054345280/mpv-v0.41.0-dev-ge5486b96d-29054345280-macos-15-arm.zip"
    sha256 "6828a41abc9375939ff469a972822eb040d15c8aa74f748764cc5a0964cfa194"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/29054345280/mpv-v0.41.0-dev-ge5486b96d-29054345280-macos-15-intel.zip"
    sha256 "b03a3d4bc4301735e9b7aee6761f301bbf8654f3a19eba0c658ee867a1746db8"
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
