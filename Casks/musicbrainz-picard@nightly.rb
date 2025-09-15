cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev7+2249.5360b1347.20250912112420"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/17673030640/macos-app-11.0-arm64.zip"
    sha256 "7ac0a31744b7f18324fdbe5230e6ca2c343176ee4d33bb7066e85edfb0d4039a"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/17673030640/macos-app-11.0-x86_64.zip"
    sha256 "d8d8d0ff234ef90e1d617621a11b1bb45909527a61d8d6fc6a9f4023a79cfcf2"
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
