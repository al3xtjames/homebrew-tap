class Transmission < Formula
  desc "Lightweight BitTorrent client"
  homepage "https://www.transmissionbt.com/"
  url "https://github.com/transmission/transmission.git",
    tag:      "3.00",
    revision: "bb6b5a062ee594dfd4b7a12a6b6e860c43849bfd"
  license any_of: ["GPL-2.0-only", "GPL-3.0-only"]
  head "https://github.com/transmission/transmission", branch: "master"

  depends_on xcode: :build
  # 3.0.0 includes library binaries built for x86-64.
  depends_on arch: :x86_64

  def install
    xcodebuild "-project", "Transmission.xcodeproj",
               "-target", "Transmission",
               "-arch", "x86_64",
               "-configuration", "Release",
               "CODE_SIGN_IDENTITY=",
               "SYMROOT=build"

    prefix.install "build/Release/Transmission.app"
  end

  test do
    system "true"
  end
end
