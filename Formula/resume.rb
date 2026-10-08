class Resume < Formula
  desc "Find and resume the right coding-agent session from your current project"
  homepage "https://github.com/luw2007/resume"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/resume/releases/download/v0.4.2/resume-v0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "a40a61115adc6d0aaf4dd244b91043eb7721c05386d797912fe1af2e9d12d748"
    else
      url "https://github.com/luw2007/resume/releases/download/v0.4.2/resume-v0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "07f5e2fea56fb635f07abca12bb047aa6fbc6594d9443d29ce8fb706598ec554"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/resume/releases/download/v0.4.2/resume-v0.4.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8f9a729f4991b161d5e920172233d82676796275484730aa4f2b70bccb54c0de"
    else
      url "https://github.com/luw2007/resume/releases/download/v0.4.2/resume-v0.4.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7ca87af78238024b0aae0c058c6d877fbdf727d52084905e6320ae8980fc57ec"
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
