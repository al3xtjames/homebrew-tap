cask "musicbrainz-picard@beta" do
  version "3.0.0b7"

  on_arm do
    url "https://data.musicbrainz.org/pub/musicbrainz/picard/MusicBrainz-Picard-#{version}-macOS-13.0-arm64.dmg"
    sha256 "a1ac1d0e5dbcb900ad45abaf7f82b3bdaf259d508d83722ccc9d526ac10f0b6c"
  end

  on_intel do
    url "https://data.musicbrainz.org/pub/musicbrainz/picard/MusicBrainz-Picard-#{version}-macOS-13.0-x86_64.dmg"
    sha256 "8e835675dbb25d657261197df33ae049e0e22f24081261dd545e2029c48162f9"
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
