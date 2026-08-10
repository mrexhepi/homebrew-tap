class Aiusage < Formula
  desc "Local dashboard for understanding AI coding usage"
  homepage "https://github.com/mrexhepi/homebrew-tap"
  version "0.7.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.7.0/aiusage_0.7.0_darwin_arm64.tar.gz"
      sha256 "af907aa059e8e59a4735bfd0d344f2b3ca645bb3fe0ff322c771973aeb40a708"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.7.0/aiusage_0.7.0_darwin_amd64.tar.gz"
      sha256 "cb4dde8f9b09e964e0f545e53b5f00cbadd3017594579f698370711595664145"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.7.0/aiusage_0.7.0_linux_arm64.tar.gz"
      sha256 "aa07976dec7dd41c07195eef894d24cb2f05ccf1a5b596d0a3537fb99de1d3cf"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.7.0/aiusage_0.7.0_linux_amd64.tar.gz"
      sha256 "cc36b228c6d08745317d6ae9f4d1ec51a1dced8934b4ce0f0824814300e2f8bc"
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
