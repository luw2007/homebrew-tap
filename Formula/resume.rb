class Resume < Formula
  desc "Find and resume the right coding-agent session from your current project"
  homepage "https://github.com/luw2007/resume"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/resume/releases/download/v0.3.7/resume-v0.3.7-aarch64-apple-darwin.tar.gz"
      sha256 "bba680402dbf344c4ac01e4f95074c122956a4bcdf3b89c2482bd118f6ca4eaa"
    else
      url "https://github.com/luw2007/resume/releases/download/v0.3.7/resume-v0.3.7-x86_64-apple-darwin.tar.gz"
      sha256 "1751de402536f7a2b33b7e825ba6e82cc4a1b862381f991eb3bd10afff91472b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/resume/releases/download/v0.3.7/resume-v0.3.7-aarch64-unknown-linux-musl.tar.gz"
      sha256 "42836380a57f863980a259ff5e8e46e29c17397be00721e3b3757aaa9a7138ae"
    else
      url "https://github.com/luw2007/resume/releases/download/v0.3.7/resume-v0.3.7-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2964d351b5912bb0c6356b80739a0440c38dadde822968d88c88184397a1c24f"
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
