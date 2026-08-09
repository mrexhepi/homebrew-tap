class Aiusage < Formula
  desc "Local dashboard for understanding AI coding usage"
  homepage "https://github.com/mrexhepi/homebrew-tap"
  version "0.6.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.6.0/aiusage_0.6.0_darwin_arm64.tar.gz"
      sha256 "a16e62c46545bab6b8884e5a50093dd3661525a1d22624f358690e43169abcc9"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.6.0/aiusage_0.6.0_darwin_amd64.tar.gz"
      sha256 "e7e1d79bbb2c96ea21780657062fee657f4d23bc96192faa05a9fa37a3a5191c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.6.0/aiusage_0.6.0_linux_arm64.tar.gz"
      sha256 "2f433f090ad4e5eafaa259a890de598444a89cd2e870d585ebbb12abf00016ec"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.6.0/aiusage_0.6.0_linux_amd64.tar.gz"
      sha256 "2b876029dfb138e40ac6b0381836ab3c21e6b64ef0716d8ff3b9986f78c9287b"
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
