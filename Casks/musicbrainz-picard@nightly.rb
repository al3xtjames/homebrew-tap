cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev7+2252.0e38ba279.20250915125533"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/17733771349/macos-app-11.0-arm64.zip"
    sha256 "cb5ffbaa154883fc0e1d0955ab43413c71fff2d8a047244acf28017a4541f7e1"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/17733771349/macos-app-11.0-x86_64.zip"
    sha256 "df7ffd9e377c3e8e5232bfc6dd2914338849ed8358faeeb5f6764906f3cef2d1"
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
