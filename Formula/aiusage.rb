class Aiusage < Formula
  desc "Local dashboard for understanding AI coding usage"
  homepage "https://github.com/mrexhepi/homebrew-tap"
  version "0.9.2"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.9.2/aiusage_0.9.2_darwin_arm64.tar.gz"
      sha256 "a211102cd83a4b737c483da0981b077e44e711a65bfdabce7fe51f9015881f05"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.9.2/aiusage_0.9.2_darwin_amd64.tar.gz"
      sha256 "6ca2b9230c1491a4b34286026f8b60a6e3f8a76b8fa471a4ab91b83a2fdef267"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.9.2/aiusage_0.9.2_linux_arm64.tar.gz"
      sha256 "cd0f0e40a58a91880cf91f4e8e6f4618a94acad4a7e1fb65b35e2d9e2d4ad52e"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.9.2/aiusage_0.9.2_linux_amd64.tar.gz"
      sha256 "39e700b821d607d2c987d8fb0a201107e14feb71176c824d9f42dbbca96085a1"
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
