class Resume < Formula
  desc "Find and resume the right coding-agent session from your current project"
  homepage "https://github.com/luw2007/resume"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/resume/releases/download/v0.3.6/resume-v0.3.6-aarch64-apple-darwin.tar.gz"
      sha256 "d6b44b1394bc4ddd7fd1d53d0462aa5f4cfd4bfab54a3e8d0838694836ffe399"
    else
      url "https://github.com/luw2007/resume/releases/download/v0.3.6/resume-v0.3.6-x86_64-apple-darwin.tar.gz"
      sha256 "8495c4298dd4958304ec3b5f168db5f8685234efad7f1e30056d1504d45872e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/resume/releases/download/v0.3.6/resume-v0.3.6-aarch64-unknown-linux-musl.tar.gz"
      sha256 "08653a41e61f9fecee4e3e677463158197e2a2569d4c14f8f1dae96b790b4506"
    else
      url "https://github.com/luw2007/resume/releases/download/v0.3.6/resume-v0.3.6-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6793fc9d5db2c94f212389442ddb958de338731d20aa89f0da593e438c4bea91"
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
