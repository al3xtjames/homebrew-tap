cask "mpv@nightly" do
  version "0.40.0-dev-g42fd091e4"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/17329907837/mpv-macos-14-arm.zip"
    sha256 "5ccad8afb747b06031b729ade1e21849dc7b6e24bbfa4b909edfb0fd4a9bbf92"
    depends_on macos: ">= :sonoma"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/17329907837/mpv-macos-13-intel.zip"
    sha256 "5508f89a6fa771d5512e6b514a5989bf0254cd74e0257d4cb5fd6a9cd204ba36"
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
