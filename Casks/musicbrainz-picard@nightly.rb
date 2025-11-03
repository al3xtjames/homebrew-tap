cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev8+2454.45c664e33.20251024133334"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/18781313438/macos-app-11.0-arm64.zip"
    sha256 "0f5f92ee310e34041a4623e1959e7120ed081937220d192e864f3c1db903847b"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/18781313438/macos-app-11.0-x86_64.zip"
    sha256 "e6251fffe96ecb30bbb74dc95c797c4eba724dc878a6495f07d164b2da7d0a32"
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
