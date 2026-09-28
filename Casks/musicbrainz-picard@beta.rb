cask "musicbrainz-picard@beta" do
  version "3.0.0rc4"

  on_arm do
    url "https://data.musicbrainz.org/pub/musicbrainz/picard/MusicBrainz-Picard-#{version}-macOS-13.0-arm64.dmg"
    sha256 "6d2fa56797b67621372ec1307a15b98a7487b48ea34528867422337363c92ef0"
  end

  on_intel do
    url "https://data.musicbrainz.org/pub/musicbrainz/picard/MusicBrainz-Picard-#{version}-macOS-13.0-x86_64.dmg"
    sha256 "57afbb8a542229fec51454350cac73fcf1a9f6af0e823faeb86bb3102f4dafb2"
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
