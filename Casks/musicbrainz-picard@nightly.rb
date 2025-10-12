cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev8+2424.99f910c4e.20251010141907"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/18409291707/macos-app-11.0-arm64.zip"
    sha256 "dafd92e3c74075b302a4ec44f90c5bca808eaf025e291f4093ef5e6946926397"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/18409291707/macos-app-11.0-x86_64.zip"
    sha256 "622a2f4ee796b062b2763874acc7254c3a8bdfb4960ff2daef47d95b962384d2"
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
