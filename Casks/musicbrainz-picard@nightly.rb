cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev9+3992.8d5a260ac.20260103210029"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/20682798184/macos-app-11.0-arm64.zip"
    sha256 "78d7a20b0c852f2dc49d1a5808aa7ba80dc4603d3596fcd1ae317ff5a662931f"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/20682798184/macos-app-11.0-x86_64.zip"
    sha256 "b0a7a8740e9ed0ee9e51ef63cd34776b02950335a8677d80692e53c196880ec5"
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
