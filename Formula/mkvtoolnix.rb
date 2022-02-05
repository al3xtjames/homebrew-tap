class Mkvtoolnix < Formula
  desc "Matroska media files manipulation tools"
  homepage "https://mkvtoolnix.download/"
  url "https://mkvtoolnix.download/sources/mkvtoolnix-64.0.0.tar.xz"
  sha256 "843ea623f21ae2407f8f42839c41a22abf116bdd509e87d875bdc737703ab953"
  license "GPL-2.0-only"
  head "https://gitlab.com/mbunkus/mkvtoolnix.git", branch: "main"

  livecheck do
    url "https://mkvtoolnix.download/sources/"
    regex(/href=.*?mkvtoolnix[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "docbook-xsl" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "po4a" => :build
  depends_on "boost"
  depends_on "cmark"
  depends_on "flac"
  depends_on "fmt"
  depends_on "gettext"
  depends_on "gmp"
  depends_on "libdvdread"
  depends_on "libebml"
  depends_on "libmagic"
  depends_on "libmatroska"
  depends_on "libogg"
  depends_on "libvorbis"
  depends_on "nlohmann-json"
  depends_on "pcre2"
  depends_on "pugixml"
  depends_on "qt"
  depends_on "utf8cpp"

  uses_from_macos "libxslt" => :build
  uses_from_macos "ruby" => :build

  on_macos do
    if MacOS.version < "10.15"
      # LLVM libcxx provides std::filesystem on older versions of macOS
      depends_on "llvm"
    end

    patch do
      url "https://gist.githubusercontent.com/al3xtjames/fd9d701a485a63af40a493ec6b9f9f9c/raw/c7f7ae318a711e2884923361b384e51a1ff01320/0001-macOS-build-add-script-to-generate-app-bundle.patch"
      sha256 "b0907f1170ebd87bf7cf953f3edf0df59de19f14ed9f980082bfe89e5f9b30ab"
    end
  end

  on_linux do
    depends_on "gcc" => :build
  end

  fails_with gcc: "<8"

  def install
    ENV.cxx11
    on_macos do
      if MacOS.version < "10.15"
        ENV["CC"] = "#{Formula["llvm"].bin}/clang"
        ENV["CXX"] = "#{Formula["llvm"].bin}/clang++"
        ENV["LDFLAGS"] = "-L#{Formula["llvm"].lib} -Wl,-rpath,#{Formula["llvm"].lib}"
      end
    end

    features = %w[cmark flac fmt gettext gmp libdvdread libebml libmagic libmatroska libogg libvorbis pugixml]
    extra_includes = ""
    extra_libs = ""
    features.each do |feature|
      extra_includes << "#{Formula[feature].opt_include};"
      extra_libs << "#{Formula[feature].opt_lib};"
    end
    extra_includes << "#{Formula["nlohmann-json"].opt_include};" \
                      "#{Formula["utf8cpp"].opt_include}/utf8cpp;"
    extra_includes.chop!
    extra_libs.chop!

    system "./autogen.sh"
    system "./configure", *std_configure_args,
                          "--with-boost=#{Formula["boost"].opt_prefix}",
                          "--with-docbook-xsl-root=#{Formula["docbook-xsl"].opt_prefix}/docbook-xsl",
                          "--with-extra-includes=#{extra_includes}",
                          "--with-extra-libs=#{extra_libs}"
    system "rake", "-j#{ENV.make_jobs}"
    system "rake", "install"

    on_macos do
      chmod "+x", "packaging/macos/build_app_bundle.sh"
      system "packaging/macos/build_app_bundle.sh", prefix.to_s
      prefix.install "MKVToolNix-#{version}.app"
    end
  end

  test do
    mkv_path = testpath/"Great.Movie.mkv"
    sub_path = testpath/"subtitles.srt"
    sub_path.write <<~EOS
      1
      00:00:10,500 --> 00:00:13,000
      Homebrew
    EOS

    system "#{bin}/mkvmerge", "-o", mkv_path, sub_path
    system "#{bin}/mkvinfo", mkv_path
    system "#{bin}/mkvextract", "tracks", mkv_path, "0:#{sub_path}"
  end
end
