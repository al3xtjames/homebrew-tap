cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev9+3970.c87540ec3.20251228144415"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/20555294155/macos-app-11.0-arm64.zip"
    sha256 "8518bcb8fb71f40a3e07e7dbf117e1617e8053b140a6e461884c94c899d0fba1"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/20555294155/macos-app-11.0-x86_64.zip"
    sha256 "feea29e9022afa4d4aea79338f63ecd8f8678065af54abbc6b405b269debf2b7"
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
