class Sbsigntools < Formula
  desc "Signing utility for UEFI secure boot"
  homepage "https://git.kernel.org/pub/scm/linux/kernel/git/jejb/sbsigntools.git"
  url "https://git.kernel.org/pub/scm/linux/kernel/git/jejb/sbsigntools.git",
    tag:      "v0.9.4",
    revision: "d52f7bbb73401aab8a1d59e8d0d686ad9641035e"
  license "GPL-3.0-or-later"
  head "https://git.kernel.org/pub/scm/linux/kernel/git/jejb/sbsigntools.git", branch: "master"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "binutils" => :build
  depends_on "gnu-efi" => :build
  depends_on "help2man" => :build
  depends_on "openssl@1.1"

  on_macos do
    depends_on "gnu-getopt" => :build
    depends_on "gnu-sed" => :build

    patch do
      url "https://gist.githubusercontent.com/al3xtjames/2908a345855a506b99babd42b3d8e6c2/raw/5b29e6524dd11d2d81b88117f756acb56fd2cfe8/Fix-endian.h-include-on-macOS.patch"
      sha256 "ea458ff870cd27f016bd59cff3cd2ffe6e11cb9548a33c98cf4fd294d3df27a1"
    end

    patch do
      url "https://gist.githubusercontent.com/al3xtjames/2908a345855a506b99babd42b3d8e6c2/raw/5b29e6524dd11d2d81b88117f756acb56fd2cfe8/Skip-sbsiglist-on-macOS.patch"
      sha256 "2eff7d8fb40584b57ed51d05985c6b2fb3910bef807e3074a6fcecbe709a378c"
    end
  end

  patch do
    url "https://gist.githubusercontent.com/al3xtjames/2908a345855a506b99babd42b3d8e6c2/raw/5b29e6524dd11d2d81b88117f756acb56fd2cfe8/Explicity-specify-AM_PROG_AR.patch"
    sha256 "4fbbd38f02f457beebfc0478dc6815280688bc99cf7e0fbc2b6360d07731be78"
  end

  def install
    inreplace "configure.ac" do |s|
      s.gsub! "/usr/lib64/gnuefi", Formula["gnu-efi"].lib.to_s
      s.gsub! "/usr/include/efi", "#{Formula["gnu-efi"].include}/efi"
    end

    if OS.mac?
      # Force use of system ar/ranlib/strip (instead of objcopy's versions)
      ENV["AR"] = "/usr/bin/ar"
      ENV["RANLIB"] = "/usr/bin/ranlib"
      ENV["STRIP"] = "/usr/bin/strip"
      inreplace "lib/ccan.git/tools/create-ccan-tree", "sed", "#{Formula["gnu-sed"].bin}/gsed"
    end

    system "./autogen.sh"
    system "./configure", *std_configure_args, "--disable-silent-rules"
    system "make", "install"
  end

  test do
    system "#{Formula["openssl@1.1"].bin}/openssl", "req", "-new", "-x509",
           "-newkey", "rsa:2048", "-sha256", "-subj", "/CN=ISK", "-nodes",
           "-keyout", "ISK.key", "-out", "ISK.pem"
    system "#{bin}/sbsign", "--key", "ISK.key", "--cert", "ISK.pem",
           "--output", "boot.efi", "/System/Library/CoreServices/boot.efi"
    system "#{bin}/sbverify", "--cert", "ISK.pem", "boot.efi"
  end
end
