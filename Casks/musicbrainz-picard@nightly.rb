cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev9+4028.21dfbfd47.20260105224444"

  on_arm do
    url "https://nightly.link/metabrainz/picard/actions/runs/20731446707/macos-app-11.0-arm64.zip"
    sha256 "186872311651e9672a49563aa49b5b231881c22642a68f4c628223a6f1bd458f"
  end

  on_intel do
    url "https://nightly.link/metabrainz/picard/actions/runs/20731446707/macos-app-11.0-x86_64.zip"
    sha256 "b477510693a0763b5c721816f79e97864a1a40c3fb5fb49fbbbb93b1d44b3c3e"
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
