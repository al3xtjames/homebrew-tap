cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev9+3928.af246333d.20251223151520"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/20464403692/macos-app-11.0-arm64.zip"
    sha256 "0f5c94b69a4dc3ba6ed81eff50667cf929daaded9695881e43964c5e3c40b0c7"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/20464403692/macos-app-11.0-x86_64.zip"
    sha256 "f272dea65d832ea88b381abf03818461fa1de28e62eafc9e80bcc922ff4c5d9b"
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
