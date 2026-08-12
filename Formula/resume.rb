class Resume < Formula
  desc "Find and resume the right coding-agent session from your current project"
  homepage "https://github.com/luw2007/resume"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/resume/releases/download/v0.3.0/resume-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "eec3bb25024d88fe01c72fd498c716ab601e8e55df8375bbb004862b01d6544c"
    else
      url "https://github.com/luw2007/resume/releases/download/v0.3.0/resume-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "c80a929df7dcb819735f843255e8ebbde19c13ec379f3187572e76590199b74a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/resume/releases/download/v0.3.0/resume-v0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2ffeb7a9183f9074da745dd5b288b059010768cdef76cce0accf38dcee6c2e69"
    else
      url "https://github.com/luw2007/resume/releases/download/v0.3.0/resume-v0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6a6cea8706a787f3fab0c1f10af8753bbe71b4abe72da93abe182a444584e9e6"
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
