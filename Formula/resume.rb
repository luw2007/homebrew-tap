class Resume < Formula
  desc "Find and resume the right coding-agent session from your current project"
  homepage "https://github.com/luw2007/resume"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/resume/releases/download/v0.3.2/resume-v0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "9f9e4e17bd59fd389821c9983c301c9a4e7a0ba081463ce3502e3570dbbe3607"
    else
      url "https://github.com/luw2007/resume/releases/download/v0.3.2/resume-v0.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "9540a0f96438d7d32bb86ca66ccc030cc9a9f1f9c4ac02604412294eac74a87d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/resume/releases/download/v0.3.2/resume-v0.3.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f64e65ce2a5fc87ca0509e89450e33fc4194184c0c0015af116f46407df7caae"
    else
      url "https://github.com/luw2007/resume/releases/download/v0.3.2/resume-v0.3.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6b922bd238d2908c74e37c28c857d4f31223816813e0b8078e3ab5130396f16f"
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
