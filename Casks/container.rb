cask "container" do
  version "1.7.1"
  sha256 "b6739caf3d47ca53a78f1a7edf32521420a75c7941838c3cefa75f30b80f5a97"

  url "https://github.com/apple/container/releases/download/#{version}/container-#{version}-installer-signed.pkg"
  name "container"
  desc "Create and run Linux containers using lightweight virtual machines"
  homepage "https://github.com/apple/container"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  pkg "container-#{version}-installer-signed.pkg"

  uninstall pkgutil: "com.apple.container-installer"

  zap trash: "~/Library/Application Support/com.apple.container"
end
