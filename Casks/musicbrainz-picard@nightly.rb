cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev10+4224.508974cb0.20260121182056"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/21220861789/macos-app-11.0-arm64.zip"
    sha256 "ae3ff2d3b5e6f7babdc8906154871ade3e8cae9257f2e3f6dc2af54f718e63b6"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/21220861789/macos-app-11.0-x86_64.zip"
    sha256 "0866345a280e1944474af7d508f5adc6ffbc8197268bbd45a7d3ae972ab6b057"
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
