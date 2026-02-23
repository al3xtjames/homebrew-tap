cask "musicbrainz-picard@nightly" do
  version "3.0.0.alpha2+19.f8dbdda36.20260220141356"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/22227367423/macos-app-11.0-arm64.zip"
    sha256 "f786e476d95390edf782aac6436e66dac803859e65d6aa60a4d68ec2c1feba59"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/22227367423/macos-app-11.0-x86_64.zip"
    sha256 "3da96b5c0316ff8d76efd09218f9bf0fcdf440cbabb3defd049bb2be56b976d8"
  end

  name "MusicBrainz Picard"
  desc "Music tagger"
  homepage "https://picard.musicbrainz.org/"

  conflicts_with cask: "musicbrainz-picard"
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
