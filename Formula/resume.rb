class Resume < Formula
  desc "Find and resume the right coding-agent session from your current project"
  homepage "https://github.com/luw2007/resume"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/resume/releases/download/v0.2.0/resume-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "489caba037d70ba13fc9f3320c5798fe68747e9ac6e4e6cbecaec43da2d6ccdf"
    else
      url "https://github.com/luw2007/resume/releases/download/v0.2.0/resume-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "c71ab415faa9080f54ce1ac364ae49857be1015bdaa9634a18667c063561e4b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/resume/releases/download/v0.2.0/resume-v0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3690fcf0ba48d102fe62d9184a01d6bd294a89a5117da5104d1effaca1b968f6"
    else
      url "https://github.com/luw2007/resume/releases/download/v0.2.0/resume-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "84a8b337071fb88a405468c88dfd10f19fcd34ee7f0c7bf71ff6de43d51bcf22"
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
