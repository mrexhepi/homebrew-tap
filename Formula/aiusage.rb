class Aiusage < Formula
  desc "Local dashboard for understanding AI coding usage"
  homepage "https://github.com/mrexhepi/aiusage"
  version "0.4.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.4.0/aiusage_0.4.0_darwin_arm64.tar.gz"
      sha256 "22745545d44755ef396e63b800e93cee1cd2c05aa224a42388ae3197031133df"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.4.0/aiusage_0.4.0_darwin_amd64.tar.gz"
      sha256 "432e6338082e3f3cfa21f55887cf665f7b54d0b92af3131bd3c56b01b4963c27"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.4.0/aiusage_0.4.0_linux_arm64.tar.gz"
      sha256 "52c3be3d4d0dbb20588969174f567df2ea1903b24aeb29c5b0d22747d2bc60fb"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.4.0/aiusage_0.4.0_linux_amd64.tar.gz"
      sha256 "dbbcfc663c9cc3593d251b233dfe0ef368169123f8d463dc02fa21a3383ce5fc"
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
