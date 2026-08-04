class Aiusage < Formula
  desc "Local dashboard for understanding AI coding usage"
  homepage "https://github.com/mrexhepi/homebrew-tap"
  version "0.5.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.5.0/aiusage_0.5.0_darwin_arm64.tar.gz"
      sha256 "b813fb888fb81b58edda7a7c22dde28a39ebfd780a5b3d2fa84796dadda87185"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.5.0/aiusage_0.5.0_darwin_amd64.tar.gz"
      sha256 "d1edd5e2c7a29406eec349b7d161790ee0e1a7a8610f9d028cb71eac26e42ad7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.5.0/aiusage_0.5.0_linux_arm64.tar.gz"
      sha256 "8f8b8ec7c0d8006fe767030ab97a0a513ac9dcef56ef06248717b90169658c90"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.5.0/aiusage_0.5.0_linux_amd64.tar.gz"
      sha256 "f170ba1e41b640000643b2f8987c379309543d5a901e9548814f11bbdd5908c2"
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
