class Ezer < Formula
  desc "AI-powered code guardian platform"
  homepage "https://github.com/alexjlennard/ezer-guardians"
  version "0.1.0-alpha.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/alexjlennard/ezer-guardians/releases/assets/422231640",
          headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}", "Accept: application/octet-stream"]
      sha256 "91d5ad87cc51b3ee39067d4e8aa9a48bdf808961fe60e2af942de1f1a3723d4e"
    else
      url "https://api.github.com/repos/alexjlennard/ezer-guardians/releases/assets/422231626",
          headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}", "Accept: application/octet-stream"]
      sha256 "5509344a4311f4afd5f8abee35ca6fb207f7931331ef1f947b6a075305584fd9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/alexjlennard/ezer-guardians/releases/assets/422231617",
          headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}", "Accept: application/octet-stream"]
      sha256 "fed69fa90cd2f41508468cc87f9484a9f014816c96afe1818f6e37ec663d0ff5"
    else
      url "https://api.github.com/repos/alexjlennard/ezer-guardians/releases/assets/422231579",
          headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}", "Accept: application/octet-stream"]
      sha256 "bacc5af4c9b89335ca8af2ef1aca316ee3033f57c19fa39e8f061a87c24d4981"
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
