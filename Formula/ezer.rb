class Ezer < Formula
  desc "AI-powered code guardian platform"
  homepage "https://github.com/alexjlennard/ezer-guardians"
  version "0.1.0-alpha.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/alexjlennard/ezer-guardians/releases/assets/422186859",
          headers: ["Authorization: token \#{ENV["HOMEBREW_GITHUB_API_TOKEN"]}", "Accept: application/octet-stream"]
      sha256 "a29b0454d57e8435c7a504af9887f13fc49b57bd6a480bea82f3a332e104cc05"
    else
      url "https://api.github.com/repos/alexjlennard/ezer-guardians/releases/assets/422186908",
          headers: ["Authorization: token \#{ENV["HOMEBREW_GITHUB_API_TOKEN"]}", "Accept: application/octet-stream"]
      sha256 "5de448b6aaa632e9c3cd759ba976acacce3c2921ed6a77408183c6589c3a50d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/alexjlennard/ezer-guardians/releases/assets/422186844",
          headers: ["Authorization: token \#{ENV["HOMEBREW_GITHUB_API_TOKEN"]}", "Accept: application/octet-stream"]
      sha256 "96beeda73bbc990566163160f4e03b9a155a32ed671184723e6aa65fb89dd18e"
    else
      url "https://api.github.com/repos/alexjlennard/ezer-guardians/releases/assets/422186864",
          headers: ["Authorization: token \#{ENV["HOMEBREW_GITHUB_API_TOKEN"]}", "Accept: application/octet-stream"]
      sha256 "3ef3b118f0e0e8c38a69905d2c3ed43c5311302deb962054ccf3cc7e3a989efb"
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
