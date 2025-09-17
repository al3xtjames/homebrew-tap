cask "mpv@nightly" do
  version "0.40.0-dev-g764da9919"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/17750851503/mpv-macos-14-arm.zip"
    sha256 "d57134d4ac3308e7e9352253fb31a4d11e80d4bb64786f658b830baa9b6e2be6"
    depends_on macos: ">= :sonoma"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/17750851503/mpv-macos-13-intel.zip"
    sha256 "4cf688905527fa0ffd06902ee7a03e131948d05c9d1d7f490c86fae7b387053f"
    depends_on macos: ">= :ventura"
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
