class Aiusage < Formula
  desc "Local dashboard for understanding AI coding usage"
  homepage "https://github.com/mrexhepi/homebrew-tap"
  version "0.9.1"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.9.1/aiusage_0.9.1_darwin_arm64.tar.gz"
      sha256 "c4ae3add43ce4b5adefaa23d70d9587e7b32f8ffa917662f5c73fcd837e88847"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.9.1/aiusage_0.9.1_darwin_amd64.tar.gz"
      sha256 "b0e38374b8e813e1b507f04ebbfc9dd0a1f2b30675321b3c8e3b99ad1f7db6ce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.9.1/aiusage_0.9.1_linux_arm64.tar.gz"
      sha256 "2a246313b8cb74f5aef554360c4e3e0b375d06e2e337ce9aeabc16c9af431568"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.9.1/aiusage_0.9.1_linux_amd64.tar.gz"
      sha256 "767713e56e8da1b3158a8ac34a51f2b2562c637de4f32d35aac46e32f7bb2cd9"
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
