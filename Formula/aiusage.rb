class Aiusage < Formula
  desc "Local dashboard for understanding AI coding usage"
  homepage "https://github.com/mrexhepi/homebrew-tap"
  version "0.9.5"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.9.5/aiusage_0.9.5_darwin_arm64.tar.gz"
      sha256 "037fa57cd03fc68fba4111efdfaa7ac0f8aa13c4deb0129388d2a24d0907d09f"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.9.5/aiusage_0.9.5_darwin_amd64.tar.gz"
      sha256 "c1b849cd4c04b4a39303cbbf8b0790e363e18c26c99183fbe4b24b4249364dd5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.9.5/aiusage_0.9.5_linux_arm64.tar.gz"
      sha256 "2ee47bbf9cb4cf38738e35db7f735a58f6951572d1716d6402cee3aae6489337"
    else
      url "https://github.com/mrexhepi/homebrew-tap/releases/download/v0.9.5/aiusage_0.9.5_linux_amd64.tar.gz"
      sha256 "3c5112260d40b4b451987f49f837b5cb8f2d34f8af4e7ada2ec6d16e27739e6f"
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
