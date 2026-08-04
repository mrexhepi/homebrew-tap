class Aiusage < Formula
  desc "Local dashboard for understanding AI coding usage"
  homepage "https://github.com/mrexhepi/homebrew-tap"
  version "0.5.1"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.5.1/aiusage_0.5.1_darwin_arm64.tar.gz"
      sha256 "f3f4c33d95c50d57b16000dd93588dd2ff8e11652c41d3b56975a6947d04d6e4"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.5.1/aiusage_0.5.1_darwin_amd64.tar.gz"
      sha256 "e7630dc16bbc9389518c60f8a8a57022f1e0f23ff437e969b75331b97d528711"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.5.1/aiusage_0.5.1_linux_arm64.tar.gz"
      sha256 "c7ab0b4c3927d2aa699cf8f254714c2c60659e934ce1e8809b9ff62e1200ed29"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.5.1/aiusage_0.5.1_linux_amd64.tar.gz"
      sha256 "b75517824311ac6d7b215a2e36ddc64a01f2f627c066b48367264f26251429b4"
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
