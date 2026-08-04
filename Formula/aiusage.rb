class Aiusage < Formula
  desc "Local dashboard for understanding AI coding usage"
  homepage "https://github.com/mrexhepi/homebrew-tap"
  version "0.4.1"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.4.1/aiusage_0.4.1_darwin_arm64.tar.gz"
      sha256 "da74f87cb993b6cb1b7b0e58d62fc998de40b7180f8c406ec1334278d08a63e7"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.4.1/aiusage_0.4.1_darwin_amd64.tar.gz"
      sha256 "ffa7628b7763c6c1055a5b4b3ad1b91fc5f0d28f8897d2a1db9076c7bd09a727"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.4.1/aiusage_0.4.1_linux_arm64.tar.gz"
      sha256 "d465b2f4599f61fcc080576d3b8ad8117ca41373288edc627956bf9ad6dca19d"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.4.1/aiusage_0.4.1_linux_amd64.tar.gz"
      sha256 "9ecc5990646f34c755c2e1ca1174d513e86754b25105272f59ac7c36b436f27f"
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
