cask "mpv@nightly" do
  version "0.41.0-dev-g333857403"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/25287158084/mpv-v0.41.0-dev-g333857403-25287158084-macos-15-arm.zip"
    sha256 "a753353016e4ad6df0d14b95e23e8beb5ec316d669ab6a68adc2c42abe52b1e1"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/25287158084/mpv-v0.41.0-dev-g333857403-25287158084-macos-15-intel.zip"
    sha256 "08c3c824a9241977c8807d8d66145a94018086078a2b523d3955d384626d5f92"
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
