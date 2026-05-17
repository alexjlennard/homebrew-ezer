class Ezer < Formula
  desc "AI-powered code guardian platform"
  homepage "https://github.com/alexjlennard/ezer-guardians"
  version "0.1.0-alpha.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/alexjlennard/ezer-guardians/releases/assets/422188436",
          headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}", "Accept: application/octet-stream"]
      sha256 "4a57ce2a21e1178761e29303157c283a2569d8b033c1af04675b4cfb55c54fcb"
    else
      url "https://api.github.com/repos/alexjlennard/ezer-guardians/releases/assets/422188357",
          headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}", "Accept: application/octet-stream"]
      sha256 "e4b0f2e0392fef8e5c414b4e314c49d7d52d0d43102f341db3ab86344b0d50a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/alexjlennard/ezer-guardians/releases/assets/422188364",
          headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}", "Accept: application/octet-stream"]
      sha256 "e3d63750897c95e74c2b68d2f3a683ab6c798f2ec4c0250b5a064c6cffd21f3a"
    else
      url "https://api.github.com/repos/alexjlennard/ezer-guardians/releases/assets/422188358",
          headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}", "Accept: application/octet-stream"]
      sha256 "9d9ea091b41cdc7bd759391fd7ae0291fc33f564de9e3ab9fa85bf33b80e8683"
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
