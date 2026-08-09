class Resume < Formula
  desc "Find and resume the right coding-agent session from your current project"
  homepage "https://github.com/luw2007/resume"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/resume/releases/download/v0.1.0/resume-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "94e35ced222fad2ac257ce5252d533b0e22eb7c152e114ac9793d72e786ed774"
    else
      url "https://github.com/luw2007/resume/releases/download/v0.1.0/resume-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "fae94ac75de92198906fd8377e40a75d9556123dea9a46b118d121ab6830c413"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/resume/releases/download/v0.1.0/resume-v0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "07d37667b217f62a27c3dd8660402632727195ffab4c1ceae6f7114dd7e90a90"
    else
      url "https://github.com/luw2007/resume/releases/download/v0.1.0/resume-v0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "33aa71ad699960dbebd65b31ff728c4776a70243b5afec68a8538fe6d1d02586"
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
