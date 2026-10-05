cask "container" do
  version "1.5.0"
  sha256 "a24808cb202318fa1c3bbee0c6c6887fe1225fe899d7b687a0ddd939bd6573f8"

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
