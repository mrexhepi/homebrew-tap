class Aiusage < Formula
  desc "Local dashboard for understanding AI coding usage"
  homepage "https://github.com/mrexhepi/homebrew-tap"
  version "0.9.4"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.9.4/aiusage_0.9.4_darwin_arm64.tar.gz"
      sha256 "f159a13b79d8fcf887f7a1bbe8fb344efdef995bc904a1733d9f33460024277a"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.9.4/aiusage_0.9.4_darwin_amd64.tar.gz"
      sha256 "75eeda9514e239583463be6f4e638bb2f48bfd2031bf34cccd1d5350d57922f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.9.4/aiusage_0.9.4_linux_arm64.tar.gz"
      sha256 "44a7bca2724618b78362f765ee47fb88e0228c5d78bcb21fbd7654e5941e56ae"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.9.4/aiusage_0.9.4_linux_amd64.tar.gz"
      sha256 "5584f5063c5ac081dc6f2f72cfcce05dce27e9cc14e858bcfddbccbaa0f3d4e4"
    end
  end

  def install
    bin.install "aiusage"
  end

  service do
    run [opt_bin/"aiusage", "serve"]
    keep_alive true
    log_path var/"log/aiusage.log"
    error_log_path var/"log/aiusage.error.log"
  end

  def caveats
    <<~EOS
      Start aiusage now and at login:
        brew services start aiusage

      Then open:
        http://127.0.0.1:7878

      Homebrew manages this installation, so do not run `aiusage install`.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aiusage version")
  end
end
