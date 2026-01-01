cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev9+3982.89dd3d232.20251231124210"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/20619155692/macos-app-11.0-arm64.zip"
    sha256 "ffeb4105c6a7d442b0e29f3d243cdf09b1f67766375de72022fc4f2e3269c576"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/20619155692/macos-app-11.0-x86_64.zip"
    sha256 "98bcb9200f0538ccb1894f44dbb6e4bb7ee5b9c106e9abb90f67aa12ab484ffb"
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
