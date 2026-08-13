class Aiusage < Formula
  desc "Local dashboard for understanding AI coding usage"
  homepage "https://github.com/mrexhepi/homebrew-tap"
  version "0.9.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.9.0/aiusage_0.9.0_darwin_arm64.tar.gz"
      sha256 "251ffe41446d90509b3c0a5a85c5f78ece9d514d3dcec57fb87be34ed86fedbe"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.9.0/aiusage_0.9.0_darwin_amd64.tar.gz"
      sha256 "3dc146d4362060ac8521833be0fe0a278216e558310e27138f617b40c44f6406"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.9.0/aiusage_0.9.0_linux_arm64.tar.gz"
      sha256 "684c6868e89b7c5a3f4d094f3681ae09e9e883cb529cc241d1fd411814fb0bf7"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.9.0/aiusage_0.9.0_linux_amd64.tar.gz"
      sha256 "ccc54eb0cb880c74c477915698064401672bd898b67713620c73e63ccaeedc2f"
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
