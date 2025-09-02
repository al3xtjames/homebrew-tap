cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev7+2229.db791dd5e.20250901170553"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/17383590439/macos-app-11.0-arm64.zip"
    sha256 "2f2bec5da3322d5639d1767a48a4dff39f5b1d8a1d5ae07dae88e383bba23b3c"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/17383590439/macos-app-11.0-x86_64.zip"
    sha256 "d4c20b2c9a28d275f6f02cb2765d666df60ee8100f94d51adff69692eb8ac7c1"
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
