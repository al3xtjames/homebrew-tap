cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev10+4129.1ae993c12.20260115050228"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/21020328646/macos-app-11.0-arm64.zip"
    sha256 "12a86ac8e94786654bd4835ef82a141acd915509e0723fdc9170cc137538a60a"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/21020328646/macos-app-11.0-x86_64.zip"
    sha256 "97e638ff229d7972f94b053e8241c1b0ac00db820066cef4322dc99ff63dcfbc"
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
