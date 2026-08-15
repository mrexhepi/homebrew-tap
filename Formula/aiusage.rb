class Aiusage < Formula
  desc "Local dashboard for understanding AI coding usage"
  homepage "https://github.com/mrexhepi/homebrew-tap"
  version "0.9.3"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.9.3/aiusage_0.9.3_darwin_arm64.tar.gz"
      sha256 "5704d000c9af9da13c463f5473416b6b67845a52faf9345c1d3cce2696775a7d"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.9.3/aiusage_0.9.3_darwin_amd64.tar.gz"
      sha256 "7b359ed94dc187deb005b059f4a789a67b9c3a46e581414c97bb0bc8916c91c0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.9.3/aiusage_0.9.3_linux_arm64.tar.gz"
      sha256 "780bc0783fa19a30b16af2729ac33183bfd9f76c6bd5e37eb31561842f9c1cec"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.9.3/aiusage_0.9.3_linux_amd64.tar.gz"
      sha256 "e398babdf31bf51d883ba2af0bf30423d7d3743c4c494f372f2d5d1237d56113"
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
