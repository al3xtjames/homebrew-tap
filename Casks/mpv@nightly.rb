cask "mpv@nightly" do
  version "0.41.0-dev-g7d245fd10"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/27431261465/mpv-v0.41.0-dev-g7d245fd10-27431261465-macos-15-arm.zip"
    sha256 "08db68e60aec74c9320d5777261c97aa95e572293e9d4cd0f667ae85ff1fbe00"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/27431261465/mpv-v0.41.0-dev-g7d245fd10-27431261465-macos-15-intel.zip"
    sha256 "f0d0a5bef0b7d8e701af2efc1a2f3e3d580e213d2d0e946fc7785a50d73bd219"
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
