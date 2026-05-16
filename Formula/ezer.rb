class Ezer < Formula
  desc "AI-powered code guardian platform"
  homepage "https://github.com/alexjlennard/ezer-guardians"
  version "0.1.0-alpha.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexjlennard/ezer-guardians/releases/download/v0.1.0-alpha.3/ezer-darwin-arm64.tar.gz"
      sha256 "c6255e2f78f637744c0169d92fd5aabb8a57d29e5eb3bf0f126e4a82e2029e08"
    else
      url "https://github.com/alexjlennard/ezer-guardians/releases/download/v0.1.0-alpha.3/ezer-darwin-x64.tar.gz"
      sha256 "94a38543b4b0466932768b8281742d42355487d1472d97af0f483728ba15a229"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/alexjlennard/ezer-guardians/releases/download/v0.1.0-alpha.3/ezer-linux-arm64.tar.gz"
      sha256 "7823f258e64ea47d1394317971a0ea9464ab3f309f263e6371d8ad27a569a77b"
    else
      url "https://github.com/alexjlennard/ezer-guardians/releases/download/v0.1.0-alpha.3/ezer-linux-x64.tar.gz"
      sha256 "44639f9bf4439b5b3f30b88d2a5e20f709f75912e66518cc940398dda463c2c8"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "ezer-darwin-arm64" => "ezer"
    elsif OS.mac?
      bin.install "ezer-darwin-x64" => "ezer"
    elsif Hardware::CPU.arm?
      bin.install "ezer-linux-arm64" => "ezer"
    else
      bin.install "ezer-linux-x64" => "ezer"
    end
  end

  test do
    assert_match "ezer", shell_output("#{bin}/ezer --version")
  end
end
