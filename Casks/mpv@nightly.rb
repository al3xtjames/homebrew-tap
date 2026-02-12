cask "mpv@nightly" do
  version "0.41.0-dev-g3847a8157"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/21846964191/mpv-v0.41.0-dev-g3847a8157-21846964191-macos-15-arm.zip"
    sha256 "259807432698389825f835cb8425749c01206fe85019afc341880719d5631ceb"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/21846964191/mpv-v0.41.0-dev-g3847a8157-21846964191-macos-15-intel.zip"
    sha256 "8b942691f5dca4ee04939f7bf9a259a5da015c3d75feb892fe6d7f6c947cfb3e"
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
