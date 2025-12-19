cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev9+3693.d2e7b8e21.20251218163028"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/20343846934/macos-app-11.0-arm64.zip"
    sha256 "7dc7ba0dd253d14670f1dc1d07ac2bd715abf7364bf149e7b239cd375152cb90"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/20343846934/macos-app-11.0-x86_64.zip"
    sha256 "1dd45dbfeda7ee18256240007c7e0cbdb987f2910737a3fa9e364e24187eea17"
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
