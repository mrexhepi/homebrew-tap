class Aiusage < Formula
  desc "Local dashboard for understanding AI coding usage"
  homepage "https://github.com/mrexhepi/homebrew-tap"
  version "0.4.3"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.4.3/aiusage_0.4.3_darwin_arm64.tar.gz"
      sha256 "44e0e3cd465a835fcb5d04106cd934d4b1157f570b7618e2051aff471018bcae"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.4.3/aiusage_0.4.3_darwin_amd64.tar.gz"
      sha256 "64f180969d40867f8ef309af7071b34dafeda2668d4b8e7e95a722a4827edf35"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.4.3/aiusage_0.4.3_linux_arm64.tar.gz"
      sha256 "bd4f876f94bef42024776a88c3d853bc6187f382bc235efc691f939b3d3e5867"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.4.3/aiusage_0.4.3_linux_amd64.tar.gz"
      sha256 "ca2f9758faace908a76c72debf831a05470f2ad6b14c0a716811898ea44a7ada"
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
