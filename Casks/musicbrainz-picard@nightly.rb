cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev6+2013.0cca1493a.20250703145127"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/16053700805/macos-app-11.0-arm64.zip"
    sha256 "74405fcb9aadb9e6856cd2d9e62a934dfc5e335fa694a3d6138c1c3ca5f10579"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/16053700805/macos-app-11.0-x86_64.zip"
    sha256 "ac6f5306b5c3c1516178fece9f2ca903a591b3cc1bf2abaed6be915349745f13"
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
