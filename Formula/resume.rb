class Resume < Formula
  desc "Find and resume the right coding-agent session from your current project"
  homepage "https://github.com/luw2007/resume"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/resume/releases/download/v0.4.1/resume-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "db3900331b2435f1553cb66701ecc03628781dd95ae4864af98bdec6e78c1b79"
    else
      url "https://github.com/luw2007/resume/releases/download/v0.4.1/resume-v0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "654773229f2947c20d15d3f9f18e01a5ff10026cbfc9f5940231d64ae77b8f31"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/resume/releases/download/v0.4.1/resume-v0.4.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3434a166328eebd2172a00ded586aa6a9272445626a91fccb6dfd27980894697"
    else
      url "https://github.com/luw2007/resume/releases/download/v0.4.1/resume-v0.4.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "723cc0b1b3917a4b501866f1c52b77a52165d51210965f6bb0093493c937439f"
    end
  end

  def install
    bin.install "resume"
    bash_completion.install "resume.bash" => "resume"
    zsh_completion.install "_resume"
    fish_completion.install "resume.fish"
  end

  test do
    assert_match "resume #{version}", shell_output("#{bin}/resume --version")
    assert_match "Find and resume coding-agent Sessions", shell_output("#{bin}/resume --help")
  end
end
