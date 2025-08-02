cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev6+2043.f43560eff.20250802093702"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/16692289152/macos-app-11.0-arm64.zip"
    sha256 "0c5c55f5e7b0416599db21bfb1d4d00fe94b04ad2714a3dd34c190b9b89a0dfc"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/16692289152/macos-app-11.0-x86_64.zip"
    sha256 "053db1db74c30ef796892960b58e35665a40305e5b364f623fc4df18f3fbfffe"
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
