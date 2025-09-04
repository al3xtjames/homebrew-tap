cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev7+2237.8cb254310.20250903193817"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/17444171583/macos-app-11.0-arm64.zip"
    sha256 "9b87debf06f2b2fa5401e09f624c1b20201db46c741b0604693981d97d9f1556"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/17444171583/macos-app-11.0-x86_64.zip"
    sha256 "334c88ad3470bcd1b253344d9f0f4b785842616915260c731bce0ca8fbfbef6e"
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
