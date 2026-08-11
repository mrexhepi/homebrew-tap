class Aiusage < Formula
  desc "Local dashboard for understanding AI coding usage"
  homepage "https://github.com/mrexhepi/homebrew-tap"
  version "0.8.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.8.0/aiusage_0.8.0_darwin_arm64.tar.gz"
      sha256 "8ac979a2d3bd34499abc7a92b5021d19ef644107b13bde72e2379bb20d0ec45c"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.8.0/aiusage_0.8.0_darwin_amd64.tar.gz"
      sha256 "f6469dbafc9d2e64eb8be534da8520ddf40e7f153c75b941ff40f33897b3af40"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.8.0/aiusage_0.8.0_linux_arm64.tar.gz"
      sha256 "5b98edfdd2734e27c7c86daefd17e186784f3cf126642502ccfb9fe3998da9d2"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.8.0/aiusage_0.8.0_linux_amd64.tar.gz"
      sha256 "a0335d7a80143a68d6190f5b6f31dbe4f0952e12c02ec1fa768a54f317076861"
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
