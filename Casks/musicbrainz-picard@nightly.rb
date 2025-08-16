cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev6+2096.c8cbe3186.20250815163724"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/16994571495/macos-app-11.0-arm64.zip"
    sha256 "908a40297daa33800d91e175f59a8657d688f46f25f498bc50860bef0cace113"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/16994571495/macos-app-11.0-x86_64.zip"
    sha256 "9a1e64c1126321f7e5bb3522914f01b7947d1c5fc4c00425565577adb7b81d49"
  end

  name "MusicBrainz Picard"
  desc "Music tagger"
  homepage "https://picard.musicbrainz.org/"

  depends_on macos: ">= :big_sur"

  app "MusicBrainz Picard.app"

  zap trash: [
    "~/.config/MusicBrainz",
    "~/Library/Caches/MusicBrainz",
    "~/Library/Preferences/org.musicbrainz.picard.plist",
    "~/Library/Saved Application State/org.musicbrainz.picard.savedState",
  ]
end
