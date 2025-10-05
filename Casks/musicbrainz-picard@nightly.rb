cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev8+2393.fec584a88.20251001221130"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/18177028719/macos-app-11.0-arm64.zip"
    sha256 "85691247d15a752ce4bf2ce3b26ca3471b858fddcc11d29b0cbf468de8b2f88c"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/18177028719/macos-app-11.0-x86_64.zip"
    sha256 "24a3a0eff7171235e773d8921c31a0cad577bfb44159f7357f3114e15819fc87"
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
