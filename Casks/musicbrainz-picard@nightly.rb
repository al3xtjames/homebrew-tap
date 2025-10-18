cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev8+2432.906ef57e7.20251018120757"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/18615383850/macos-app-11.0-arm64.zip"
    sha256 "129a40552d76d803a094fb706dfdbe84af6aa65b6548c9db81c0a2ccaa3bd440"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/18615383850/macos-app-11.0-x86_64.zip"
    sha256 "1bb30cd47516ef9b257fb9fc55a8fffb522113539b26d97dbd636c6e4aa72951"
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
