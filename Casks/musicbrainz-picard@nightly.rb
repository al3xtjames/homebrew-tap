cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev9+3933.d1537d448.20251225150345"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/20506938895/macos-app-11.0-arm64.zip"
    sha256 "793dec7d41dadf442670426c141fa135803d25068195fa630c8aab7263740ae5"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/20506938895/macos-app-11.0-x86_64.zip"
    sha256 "72b6528e488f182a3a584a29c87e8d3a2d9f74a0c1d5130e54b3d0938b491e3a"
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
