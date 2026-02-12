cask "musicbrainz-picard@nightly" do
  version "3.0.0.alpha2+7.3f2985596.20260211151602"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/21910770308/macos-app-11.0-arm64.zip"
    sha256 "7ad8a8752d2d97dfbd8aa8e1d1a0b4385a74b43bbaefcbd82bc75a0a965f98f4"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/21910770308/macos-app-11.0-x86_64.zip"
    sha256 "36f1e17594123c08e8f101e18093c14601e0b61f516c1c7165c86a1a4a3564dd"
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
