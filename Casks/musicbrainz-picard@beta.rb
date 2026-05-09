cask "musicbrainz-picard@beta" do
  version "3.0.0b1"

  on_arm do
    url "https://github.com/metabrainz/picard/releases/download/release-#{version}/MusicBrainz-Picard-#{version}-macOS-11.0-arm64.dmg"
    sha256 "ba6e9d99e1f1b832cfe1fa25aa03778252c3079c8c0293108270e321122d138b"
  end

  on_intel do
    url "https://github.com/metabrainz/picard/releases/download/release-#{version}/MusicBrainz-Picard-#{version}-macOS-11.0-x86_64.dmg"
    sha256 "eea0e478b09bdf966c28ba87825425184af2f99947eefc661c6c8e02c9462af4"
  end

  name "MusicBrainz Picard"
  desc "Music tagger"
  homepage "https://picard.musicbrainz.org/"

  conflicts_with cask: [
    "musicbrainz-picard",
    "musicbrainz-picard@nightly",
  ]
  depends_on macos: ">= :big_sur"

  app "MusicBrainz Picard.app"

  uninstall quit: "org.musicbrainz.Picard"

  zap trash: [
    "~/.config/MusicBrainz",
    "~/Library/Caches/MusicBrainz",
    "~/Library/Preferences/org.musicbrainz.picard.plist",
    "~/Library/Saved Application State/org.musicbrainz.picard.savedState",
  ]
end
