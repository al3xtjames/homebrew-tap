cask "mpv@nightly" do
  version "0.40.0-dev-g0a53407a4"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/18427001415/mpv-macos-14-arm.zip"
    sha256 "effc269022b2504a409b31636d58c98e3d6313c5bd1e029c5ad188e68b1487d1"
    depends_on macos: ">= :sonoma"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/18427001415/mpv-macos-13-intel.zip"
    sha256 "e5c93cada29e72900dccb561c5a9d39c2f02d80878c289a51e81df9e3ff57060"
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
