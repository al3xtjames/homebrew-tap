cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev9+3940.734fade5e.20251226171416"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/20526315379/macos-app-11.0-arm64.zip"
    sha256 "d96cfc5d8c1bb048a6d374df32d0c7a25e7a28b6d7052cbd8d752b133eb9eb89"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/20526315379/macos-app-11.0-x86_64.zip"
    sha256 "3efee4621d0148c48f04bf5cccd868fcbbd28771fd9ef957b9fee9c0befd38ed"
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
