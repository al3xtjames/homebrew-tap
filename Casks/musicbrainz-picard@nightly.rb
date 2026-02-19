cask "musicbrainz-picard@nightly" do
  version "3.0.0.alpha2+18.540bce51d.20260218204829"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/22156968204/macos-app-11.0-arm64.zip"
    sha256 "b7c500310da57bb464e3a3f2f444896dab08ca2bcce7f4c09e80934e3789e76d"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/22156968204/macos-app-11.0-x86_64.zip"
    sha256 "c9b23d1669c6b340d0c5494725ab63f3e337baaff11fc4dbc3a081bc8793f550"
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
