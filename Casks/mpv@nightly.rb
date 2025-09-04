cask "mpv@nightly" do
  version "0.40.0-dev-gb9ceaf243"

  on_arm do
    url "https://nightly.link/mpv-player/mpv/actions/runs/17414221578/mpv-macos-14-arm.zip"
    sha256 "cd3303a11a628c08c644df33713d737adb81847277f6be83d0dd8a750530b566"
    depends_on macos: ">= :sonoma"
  end

  on_intel do
    url "https://nightly.link/mpv-player/mpv/actions/runs/17414221578/mpv-macos-13-intel.zip"
    sha256 "156f1ff8b42b94a2e457b5bf47781a67795324c740cb47b097525e0dabb0f830"
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
