cask "mpv" do
  version "0.41.0"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20414542745/mpv-macos-15-arm.zip"
    sha256 "489cf6a54f57c54f86ad8d7cedaf5bb26848770d58dc059021214e2f689ee799"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20414542745/mpv-macos-15-intel.zip"
    sha256 "41003617ab4f7784394b5ddea7ce51b3e0838e8cfc8166ad1a378b2eda3b583c"
  end

  name "mpv"
  desc "Media player based on MPlayer and mplayer2"
  homepage "https://mpv.io/"

  conflicts_with cask: "mpv@nightly"
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
