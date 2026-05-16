class Ezer < Formula
  desc "AI-powered code guardian platform"
  homepage "https://github.com/alexjlennard/ezer-guardians"
  version "0.1.0-alpha.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexjlennard/ezer-guardians/releases/download/v0.1.0-alpha.2/ezer-darwin-arm64.tar.gz"
      sha256 "placeholder"
    else
      url "https://github.com/alexjlennard/ezer-guardians/releases/download/v0.1.0-alpha.2/ezer-darwin-x64.tar.gz"
      sha256 "placeholder"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/alexjlennard/ezer-guardians/releases/download/v0.1.0-alpha.2/ezer-linux-arm64.tar.gz"
      sha256 "placeholder"
    else
      url "https://github.com/alexjlennard/ezer-guardians/releases/download/v0.1.0-alpha.2/ezer-linux-x64.tar.gz"
      sha256 "placeholder"
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
