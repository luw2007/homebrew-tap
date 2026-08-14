class Resume < Formula
  desc "Find and resume the right coding-agent session from your current project"
  homepage "https://github.com/luw2007/resume"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/resume/releases/download/v0.3.1/resume-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "d49849050ff6c8bf6ce12230be03e1ad958c2c472381d7dadae8658cce912c9a"
    else
      url "https://github.com/luw2007/resume/releases/download/v0.3.1/resume-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "0b052ba402cf5dc3e7c93e4391eae5814f2359e11324c3a2463fcbfb6edb1314"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/resume/releases/download/v0.3.1/resume-v0.3.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "542326b9aa432abe13840aaf26048f7a0e8f23c9852eb3226899eeeb1abf551b"
    else
      url "https://github.com/luw2007/resume/releases/download/v0.3.1/resume-v0.3.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b7988857e0a91172edb4b58030f28571413953284e8c472597ffb97129975961"
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
