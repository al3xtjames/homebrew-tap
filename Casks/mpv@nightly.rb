cask "mpv@nightly" do
  version "0.41.0-dev-g7a94ec571"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/28665334552/mpv-v0.41.0-dev-g7a94ec571-28665334552-macos-15-arm.zip"
    sha256 "e676b9756d246c3639897089fdb5c42acd89564c3bec4d5485488da4e82946bc"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/28665334552/mpv-v0.41.0-dev-g7a94ec571-28665334552-macos-15-intel.zip"
    sha256 "76deb9a7ecf2378801a6ca6106e22b69655a04a08a9b17c5f97e78cba18ccc23"
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
