cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev6+2070.8cd270f17.20250812081111"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/16902854489/macos-app-11.0-arm64.zip"
    sha256 "0e4df00da0b9f968bb5ac2b92a24def4d57032264177fb6c5f8e6e0bcc29bf4a"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/16902854489/macos-app-11.0-x86_64.zip"
    sha256 "3016aa8e37d997011303bb1bd4d6a72d228b68fd08f82e66afcc1d02241019d9"
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
