cask "musicbrainz-picard@nightly" do
  version "3.0.0.alpha3+68.dd5cff30e.20260226201304"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/22459327939/macos-app-11.0-arm64.zip"
    sha256 "5e3150f86aa74ad7f10de2314b12e38f5f0726c66c14437d54d7938359d9242f"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/22459327939/macos-app-11.0-x86_64.zip"
    sha256 "4497685acdc0893bbef46d3f916e1bfd1b482fcc50367e2e58e2084957d0621e"
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
