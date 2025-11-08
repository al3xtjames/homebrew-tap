cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev8+2462.0bca92912.20251106132520"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/19137101650/macos-app-11.0-arm64.zip"
    sha256 "7992905096024048b5a99d01ff29e134bf4ebe95d3f08a7c3068c14376cd5c3d"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/19137101650/macos-app-11.0-x86_64.zip"
    sha256 "396760ed65b9de473a525752342e4626c81a0ac92337facde3ac339098286345"
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
