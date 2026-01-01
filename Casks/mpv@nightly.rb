cask "mpv@nightly" do
  version "0.41.0-dev-g72efbfd00"
  depends_on macos: ">= :sequoia"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20638570420/mpv-v0.41.0-dev-g72efbfd00-20638570420-macos-15-arm.zip"
    sha256 "71a2e2bb291d5c956ab36b5cf81901945dad6ec1fc433ef34e53e917f85e74bc"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20638570420/mpv-v0.41.0-dev-g72efbfd00-20638570420-macos-15-intel.zip"
    sha256 "d1cfb918e88a83c81c3f933b1818c601aad9979385462a89055eec9a31196fe6"
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
