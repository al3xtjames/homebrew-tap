cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev9+3987.646b9d70e.20260102135249"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/20659114555/macos-app-11.0-arm64.zip"
    sha256 "0141bb40d3f57bfbd54a685ae25d756d80ffbd31f160b78efdb4a6a7043eccea"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/20659114555/macos-app-11.0-x86_64.zip"
    sha256 "6814fe428a52eb3063592071b557e21f75e8fe865fccb73c59df6fe3706cc0ba"
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
