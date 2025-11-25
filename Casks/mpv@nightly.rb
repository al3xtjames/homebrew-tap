cask "mpv@nightly" do
  version "0.40.0-dev-g57d9d4eb4"
  depends_on macos: ">= :sequoia"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/19681674912/mpv-macos-15-arm.zip"
    sha256 "2e7e944214b80ec329c953118db88fdc840e47909a7b3260db4109bac8dc6382"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/19681674912/mpv-macos-15-intel.zip"
    sha256 "6e19fd91a6872a1261ceb822cc7144aac3c4a53f1fca7a6456fcc289f9402c4f"
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
