cask "mpv" do
  arch arm: "arm", intel: "intel"

  macos_version = nil

  version "0.42.0"

  on_arm do
    on_sequoia do
      macos_version = 15
      sha256 "be1b8d2445e6880860869c080b8710dee189721f1fa4689840db6a2c10d7be69"
    end

    on_tahoe do
      macos_version = 26
      sha256 "81bffbda01d69eec566ee3f576a2d0089447ba4b21dece3954f08109d5435ce1"
    end

    on_golden_gate :or_newer do
      macos_version = 27
      sha256 "87c7af5d908eb85217899b57d9a24cc9f5316daa93bb6b4a494a34cea25330b7"
    end
  end
  on_intel do
    macos_version = 15
    sha256 "2d2f34350ff844b6014c35f21ca142937275e19c0c673150a8564fcd2f3bfa14"
  end

  url "https://github.com/mpv-player/mpv/releases/download/v#{version}/mpv-v#{version}-macos-#{macos_version}-#{arch}.zip"
  name "mpv"
  desc "Media player based on MPlayer and mplayer2"
  homepage "https://mpv.io/"

  conflicts_with cask: "mpv@nightly"
  depends_on macos: :sequoia

  app "mpv.app"
  command_wrapper "mpv", executable: "#{appdir}/mpv.app/Contents/MacOS/mpv"

  uninstall quit: "io.mpv"

  zap trash: [
    "~/.config/mpv",
    "~/Library/Logs/mpv.log",
    "~/Library/Preferences/io.mpv.plist",
    "~/Library/Preferences/mpv.plist",
  ]
end
