cask "musicbrainz-picard@nightly" do
  version "3.0.0.dev6+2013.0cca1493a.20250703145127"

  on_arm do
    url "https://web.archive.org/web/20250707041125if_/https://productionresultssa4.blob.core.windows.net/actions-results/d5ed3966-1e80-4221-af51-025b85914312/workflow-job-run-8dc3de5c-90dd-5696-b81a-24c6b889bb5b/artifacts/d07dbb128832e4bb18475ff42fc3a334f3a4924475a502ce5bde2e100884d20f.zip?rscd=attachment%3B+filename%3D%22macos-app-11.0-arm64.zip%22&se=2025-07-07T04%3A21%3A14Z&sig=whTokIlx41c8NaXrMClFzE0EOylV22Ts2EbzSwJwah4%3D&ske=2025-07-07T14%3A38%3A25Z&skoid=ca7593d4-ee42-46cd-af88-8b886a2f84eb&sks=b&skt=2025-07-07T02%3A38%3A25Z&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skv=2025-05-05&sp=r&spr=https&sr=b&st=2025-07-07T04%3A11%3A09Z&sv=2025-05-05"
    sha256 "74405fcb9aadb9e6856cd2d9e62a934dfc5e335fa694a3d6138c1c3ca5f10579"
  end

  on_intel do
    url "https://web.archive.org/web/20250707044844/https://productionresultssa4.blob.core.windows.net/actions-results/d5ed3966-1e80-4221-af51-025b85914312/workflow-job-run-8216b5d7-2fc1-593a-82a9-fe57f909acc1/artifacts/7b24b7159b280e55205b5e5d34cbc8a687f32e9e3df74c36e3b8b63ac4de665f.zip?rscd=attachment%3B+filename%3D%22macos-app-11.0-x86_64.zip%22&se=2025-07-07T04%3A58%3A41Z&sig=AxCLzkLRNBcb4dVVvqZ%2FZisCqpXCjID8oTLf%2BPBcLBI%3D&ske=2025-07-07T14%3A34%3A13Z&skoid=ca7593d4-ee42-46cd-af88-8b886a2f84eb&sks=b&skt=2025-07-07T02%3A34%3A13Z&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skv=2025-05-05&sp=r&spr=https&sr=b&st=2025-07-07T04%3A48%3A36Z&sv=2025-05-05"
    sha256 "ac6f5306b5c3c1516178fece9f2ca903a591b3cc1bf2abaed6be915349745f13"
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
