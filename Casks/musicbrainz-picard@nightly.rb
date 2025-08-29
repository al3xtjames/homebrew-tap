cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev7+2180.57dac026b.20250829090515"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/17319590458/macos-app-11.0-arm64.zip"
    sha256 "aaef265e65c7f6e319e93b3c58762e70042853e2a1ddb68c45ee2ff996e5a37e"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/17319590458/macos-app-11.0-x86_64.zip"
    sha256 "447f58e06edabf0598010ad6c82dda6cc335d05710f2cece147d013cd2380f47"
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
