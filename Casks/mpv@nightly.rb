cask "mpv@nightly" do
  version "0.40.0-dev-g28ef6b780"
  depends_on macos: ">= :sequoia"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/19113635200/mpv-macos-15-arm.zip"
    sha256 "b66d34363d29492325ad12af154b68ea924198864513e2ba05dd6e7a4882dbea"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/19113635200/mpv-macos-15-intel.zip"
    sha256 "2db65ec9ad2ced8324731c25ca7eaa89c90d932f0eca1bd9592af6e489d668f2"
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
