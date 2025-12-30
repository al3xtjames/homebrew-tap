cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev9+3981.2811d543c.20251230091233"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/20593065582/macos-app-11.0-arm64.zip"
    sha256 "ef1a1d551cf8b33a1a44dd191917fcf14098b0346f6ef9b62a0580a6d2ca3d71"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/20593065582/macos-app-11.0-x86_64.zip"
    sha256 "b627b634839f30d57b4143d759dd2a786b032a4b30feb423fb29d899f259ce5c"
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
