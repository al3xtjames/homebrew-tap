cask "mpv@nightly" do
  version "0.41.0-dev-g75bb65194"
  depends_on macos: ">= :sequoia"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20479530868/mpv-macos-15-arm.zip"
    sha256 "67790113f905add08923bfa99c18c4b91f4bc03bfa5a8aff67baacd981f03acf"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/20479530868/mpv-macos-15-intel.zip"
    sha256 "62321c281723e919e832e4c1f398673a8a77c6ed0ee55c7a2fba287a1d438ab5"
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
