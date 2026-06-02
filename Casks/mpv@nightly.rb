cask "mpv@nightly" do
  version "0.41.0-dev-g02273e9d9"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/26812810842/mpv-v0.41.0-dev-g02273e9d9-26812810842-macos-15-arm.zip"
    sha256 "158e158fe57dc55138775218203a3ccb3e754acd79839bca27a3bc3086b5fc41"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/26812810842/mpv-v0.41.0-dev-g02273e9d9-26812810842-macos-15-intel.zip"
    sha256 "51a20f481ffb8bee7d48b2a2664568baad9ef6694d224e2541ffcf9c80355089"
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
