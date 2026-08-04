class Aiusage < Formula
  desc "Local dashboard for understanding AI coding usage"
  homepage "https://github.com/mrexhepi/homebrew-tap"
  version "0.5.2"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.5.2/aiusage_0.5.2_darwin_arm64.tar.gz"
      sha256 "7f52fdbdf7a3381dcc71b52ccb80d1e909ddb4c6316194918bbf066bf916d1d7"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.5.2/aiusage_0.5.2_darwin_amd64.tar.gz"
      sha256 "1ef0af178acdf755e8abb14c46a1f90d65b1151b3456e8bb9cc333386240a2f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.5.2/aiusage_0.5.2_linux_arm64.tar.gz"
      sha256 "943db295329728288923681214d9e9222d8402b6e996267f4cda97adeffd06c3"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.5.2/aiusage_0.5.2_linux_amd64.tar.gz"
      sha256 "68f7c5b0052e2d926107f58e444eed6504cbc8b1e263b625bc802a3a260745ce"
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
