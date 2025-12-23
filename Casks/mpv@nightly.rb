cask "mpv@nightly" do
  version "0.41.0-dev-g6dff941c7"
  depends_on macos: ">= :sequoia"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20452931159/mpv-macos-15-arm.zip"
    sha256 "9ee1aabaf909d7785fad6d7721f13ce0d91d73a1baea445620735c65cc8c1b4e"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20452931159/mpv-macos-15-intel.zip"
    sha256 "9dc61b0c77bf01c97972a02cef10f069e5c0077e96b4d1afc7c248cf8343e86f"
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
