cask "musicbrainz-picard@beta" do
  version "3.0.0b4"

  on_arm do
    url "https://github.com/metabrainz/picard/releases/download/release-#{version}/MusicBrainz-Picard-#{version}-macOS-13.0-arm64.dmg"
    sha256 "bdb9d446b9d48c67a5f6ae5c88720522ee0e5f371399034963eb2ecad0531661"
  end

  on_intel do
    url "https://github.com/metabrainz/picard/releases/download/release-#{version}/MusicBrainz-Picard-#{version}-macOS-13.0-x86_64.dmg"
    sha256 "589ec63dd550c69df0307782be68b0bfc44128cd5d1ce083d7e27758c5a72486"
  end

  name "MusicBrainz Picard"
  desc "Music tagger"
  homepage "https://picard.musicbrainz.org/"

  conflicts_with cask: [
    "musicbrainz-picard",
    "musicbrainz-picard@nightly",
  ]
  depends_on macos: :ventura

  app "MusicBrainz Picard.app"

  uninstall quit: "org.musicbrainz.Picard"

  zap trash: [
    "~/.config/MusicBrainz",
    "~/Library/Caches/MusicBrainz",
    "~/Library/Preferences/org.musicbrainz.picard.plist",
    "~/Library/Saved Application State/org.musicbrainz.picard.savedState",
  ]
end
