class Resume < Formula
  desc "Find and resume the right coding-agent session from your current project"
  homepage "https://github.com/luw2007/resume"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/resume/releases/download/v0.2.1/resume-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "7964f5f7eb26ad0d2e77f1f49e757d78251597f246b2a312d57ad6bd3fd42566"
    else
      url "https://github.com/luw2007/resume/releases/download/v0.2.1/resume-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "718c5da44f2c413978b63361d71e42f79876c32b4e15be682fd9d62f2f1ce019"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/resume/releases/download/v0.2.1/resume-v0.2.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "790c491a8b09ba6cad28b39f0d684e9bc366647f6073d71f394f83874782b7b1"
    else
      url "https://github.com/luw2007/resume/releases/download/v0.2.1/resume-v0.2.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d110cf72b3a8574af753a8b3c17d321e648deef52560957a1c6f282d4236c264"
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
