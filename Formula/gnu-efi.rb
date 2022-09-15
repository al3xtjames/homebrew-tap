class GnuEfi < Formula
  desc "Develop EFI applications using the GNU toolchain"
  homepage "https://sourceforge.net/projects/gnu-efi/"
  url "https://cytranet.dl.sourceforge.net/project/gnu-efi/gnu-efi-3.0.15.tar.bz2"
  sha256 "931a257b9c5c1ba65ff519f18373c438a26825f2db7866b163e96d1b168f20ea"
  license "BSD-2-Clause"
  head "git://git.code.sf.net/p/gnu-efi/code", branch: "master"

  depends_on "x86_64-elf-binutils" => :build
  depends_on "x86_64-elf-gcc" => :build

  on_macos do
    patch do
      url "https://gist.githubusercontent.com/al3xtjames/4365fca5ed0db0ab55d0066a432fef54/raw/c024a1193fbec01dc2787557dfbcb36ab4a7d49c/Add-elf.h-for-macOS.patch"
      sha256 "c494e3ed594dabf66c2c7546a38c558370f8ffe3899c767d42253325f7966ee0"
    end
  end

  def install
    ENV["CROSS_COMPILE"] = "x86_64-elf-"
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    # https://www.rodsbooks.com/efi-programming/hello.html
    (testpath/"hello.c").write <<~'EOS'
      #include <efi.h>
      #include <efilib.h>

      EFI_STATUS
      EFIAPI
      efi_main (EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable) {
        InitializeLib(ImageHandle, SystemTable);
        Print(L"Hello, world!\n");

        return EFI_SUCCESS;
      }
    EOS

    system "#{Formula["x86_64-elf-gcc"].bin}/x86_64-elf-gcc", "-std=c11",
           "-ffreestanding", "-fpic", "-fshort-wchar", "-fno-strict-aliasing",
           "-fno-stack-protector", "-fno-stack-check", "-mno-red-zone",
           "-mno-avx", "-maccumulate-outgoing-args", "-DGNU_EFI_USE_MS_ABI",
           "-I#{include}/efi", "-c", "hello.c", "-o", "hello.o"

    system "#{Formula["x86_64-elf-binutils"].bin}/x86_64-elf-ld", "-nostdlib",
           "-T", "#{lib}/elf_x86_64_efi.lds", "-shared",
           "-Bsymbolic", "-L", lib.to_s, "-lefi", "-lgnuefi",
           "#{lib}/crt0-efi-x86_64.o", "hello.o", "-o", "hello.so"

    system "#{Formula["x86_64-elf-binutils"].bin}/x86_64-elf-objcopy",
           "-j", ".text", "-j", ".sdata", "-j", ".data", "-j", ".dynamic",
           "-j", ".dynsym", "-j", ".rel", "-j", ".rela", "-j", ".reloc",
           "--target", "efi-app-x86_64", "hello.so", "hello.efi"
  end
end
