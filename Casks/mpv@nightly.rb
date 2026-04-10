cask "mpv@nightly" do
  version "0.41.0-dev-g75939c211"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/24208962879/mpv-v0.41.0-dev-g75939c211-24208962879-macos-15-arm.zip"
    sha256 "cca6dad5e61890cfd59621c47cb4bdb85d9800733e1eb18204ce76f2cc56dad3"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/24208962879/mpv-v0.41.0-dev-g75939c211-24208962879-macos-15-intel.zip"
    sha256 "bdd67b6840e1015673ba33c9f966bcaecdf506702144d2d2a62aa815cbdb540f"
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
