cask "chelsio-network-driver" do
  version "1.25.0"
  sha256 "343ab1a2326bbea4758c2d588bc3bad0e5846b04eec59c3bbe347fd0e3dbd087"

  url "https://service.chelsio.com/store2/T5/Network%20Driver%20(NIC)/Mac%20OS%20X/cxgb-#{version}/Chelsio-Mac-Package-#{version}.zip"
  name "Chelsio Network Driver"
  desc "Chelsio T6/T5 Network Driver for macOS"
  homepage "https://service.chelsio.com/store2/T5/Network%20Driver%20(NIC)/Mac%20OS%20X/cxgb-#{version}/README.txt"

  depends_on macos: ">= :sequoia"

  pkg "cxgb.pkg"

  uninstall pkgutil: "com.chelsio.cxgb.*",
            kext:    "com.intel.driver.EnergyDriver"

  zap trash: [
    "~/Library/Caches/com.intel.PowerGadget",
    "~/Library/Preferences/com.intel.PowerGadget.plist",
  ]
end
