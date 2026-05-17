class Ezer < Formula
  desc "AI-powered code guardian platform"
  homepage "https://github.com/alexjlennard/ezer-guardians"
  version "0.1.0-alpha.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/alexjlennard/ezer-guardians/releases/assets/422191126",
          headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}", "Accept: application/octet-stream"]
      sha256 "f06d42ffff06acbb808f89a6c8d038213cc0a14135111bfaf7a1dcdda6278e54"
    else
      url "https://api.github.com/repos/alexjlennard/ezer-guardians/releases/assets/422191113",
          headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}", "Accept: application/octet-stream"]
      sha256 "bf522f388a5cfcfc41abea986478e8164f6f9e3fc8b9da79615c0d6597ec0b81"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/alexjlennard/ezer-guardians/releases/assets/422191118",
          headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}", "Accept: application/octet-stream"]
      sha256 "08c6367b3a092e6772ee4fb641e4abee10f4d029598c165974ed9c7b4df888e0"
    else
      url "https://api.github.com/repos/alexjlennard/ezer-guardians/releases/assets/422191107",
          headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}", "Accept: application/octet-stream"]
      sha256 "5db8c2f12f6f8ff95156d1aa8eeecc1805be82287d8b47f211cb442b27761415"
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
