class Aiusage < Formula
  desc "Local dashboard for understanding AI coding usage"
  homepage "https://github.com/mrexhepi/homebrew-tap"
  version "0.4.2"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.4.2/aiusage_0.4.2_darwin_arm64.tar.gz"
      sha256 "129ec0f36f582a38a10899477de903ed8e913ac83b16cfc68aa34851612a2a48"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.4.2/aiusage_0.4.2_darwin_amd64.tar.gz"
      sha256 "33fa4f2434081a9f9cf50fc1d58fa85cf8f739cd0111ca4fea6a23ccdc809ec7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.4.2/aiusage_0.4.2_linux_arm64.tar.gz"
      sha256 "d79ff21ea8f2b9bef9f78448ac1c2cd6b9e70e835de814c537cc7f30a9af2807"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.4.2/aiusage_0.4.2_linux_amd64.tar.gz"
      sha256 "994f11feda1d1afc985df2ebc538943bb6cc4b5deee008a0977b53bd3d0de1cc"
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
