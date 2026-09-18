class Resume < Formula
  desc "Find and resume the right coding-agent session from your current project"
  homepage "https://github.com/luw2007/resume"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/resume/releases/download/v0.4.0/resume-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "3b0b8acc9c4ff19c729cb24d7e947aa8e174dd0f753fbb0977ccfc2203a861f0"
    else
      url "https://github.com/luw2007/resume/releases/download/v0.4.0/resume-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "ce4f8f5520b4dd72c9b92ca154f26067cf1288ab75e135165fb3a8b87df4b6a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/resume/releases/download/v0.4.0/resume-v0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a6d03b6fd90c671b1aca6fc6103475ca0d18d70a59be5c579d8814b90fa891c2"
    else
      url "https://github.com/luw2007/resume/releases/download/v0.4.0/resume-v0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "da46e141e469f4b4b7f5deddda20471a46dbadcdaa5d48c76c278e7fd7ed8b4d"
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
