class Ezer < Formula
  desc "AI-powered code guardian platform"
  homepage "https://github.com/alexjlennard/ezer-guardians"
  version "0.1.0-alpha.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/alexjlennard/ezer-guardians/releases/assets/422193702",
          headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}", "Accept: application/octet-stream"]
      sha256 "2ec02e613956e7d7dd037ca8b6a058b729797929a9d8490b5373338daebdedd1"
    else
      url "https://api.github.com/repos/alexjlennard/ezer-guardians/releases/assets/422193731",
          headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}", "Accept: application/octet-stream"]
      sha256 "0e650493166823d25de1fe8a9aaa333f9cc60f8994ab6bdd8a3d4072536c4293"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/alexjlennard/ezer-guardians/releases/assets/422193788",
          headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}", "Accept: application/octet-stream"]
      sha256 "f5b98de67b10796ba0aebcef0898f8da6b9e4a37c452745bf2d743625d4635db"
    else
      url "https://api.github.com/repos/alexjlennard/ezer-guardians/releases/assets/422193796",
          headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}", "Accept: application/octet-stream"]
      sha256 "7742d8d18abd10e280e5174052d4b799fa118ab491a6bbc0e0671f5fe851637d"
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
