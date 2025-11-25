cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev8+2485.bca34c9d9.20251117172924"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/19438601658/macos-app-11.0-arm64.zip"
    sha256 "3492e6e519665196d4f2aa67d56774dabde9db2a6340956bc907f5774d69a233"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/19438601658/macos-app-11.0-x86_64.zip"
    sha256 "c6cd6588eeec39f0671ec8858f2ec6d5bfac5674e7273b1fb1f7dc55eb4a9a37"
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
