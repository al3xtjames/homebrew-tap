cask "musicbrainz-picard@beta" do
  version "3.0.0b5"

  on_arm do
    url "https://data.musicbrainz.org/pub/musicbrainz/picard/MusicBrainz-Picard-#{version}-macOS-13.0-arm64.dmg"
    sha256 "6129fbb09dc35df1507c6eebbedafba2fc38a156dec9e854496dc85f4cd06dab"
  end

  on_intel do
    url "https://data.musicbrainz.org/pub/musicbrainz/picard/MusicBrainz-Picard-#{version}-macOS-13.0-x86_64.dmg"
    sha256 "50f3b1fe0dbdcba73effa4824bbaef29dafa8120c5adf443abe1be646a5e8682"
  end

  name "MusicBrainz Picard"
  desc "Music tagger"
  homepage "https://picard.musicbrainz.org/"

  conflicts_with cask: [
    "musicbrainz-picard",
    "musicbrainz-picard@nightly",
  ]
  depends_on macos: :ventura

  app "MusicBrainz Picard.app"

  uninstall quit: "org.musicbrainz.Picard"

  zap trash: [
    "~/.config/MusicBrainz",
    "~/Library/Caches/MusicBrainz",
    "~/Library/Preferences/org.musicbrainz.picard.plist",
    "~/Library/Saved Application State/org.musicbrainz.picard.savedState",
  ]
end
