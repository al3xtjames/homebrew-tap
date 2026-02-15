cask "musicbrainz-picard@nightly" do
  version "3.0.0.alpha2+14.e1582b182.20260214120024"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/22016941818/macos-app-11.0-arm64.zip"
    sha256 "ed9cf25882991f7e31ef0b319566568ac64a15556def18fe97bdc699af13d721"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/22016941818/macos-app-11.0-x86_64.zip"
    sha256 "3a0f441a3e4bf1a30b7335cf0933136d3fe96da22eb58a204f1301551a5bb089"
  end

  name "MusicBrainz Picard"
  desc "Music tagger"
  homepage "https://picard.musicbrainz.org/"

  conflicts_with cask: "musicbrainz-picard"
  depends_on macos: ">= :big_sur"

  app "MusicBrainz Picard.app"

  uninstall quit: "org.musicbrainz.Picard"

  zap trash: [
    "~/.config/MusicBrainz",
    "~/Library/Caches/MusicBrainz",
    "~/Library/Preferences/org.musicbrainz.picard.plist",
    "~/Library/Saved Application State/org.musicbrainz.picard.savedState",
  ]
end
