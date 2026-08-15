class SkillOverlay < Formula
  desc "Keep local skill customizations across upstream Agent Skills updates"
  homepage "https://github.com/luw2007/skill-overlay"
  url "https://github.com/luw2007/skill-overlay/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "02f179a57b34bed60c0bb8351de180707c32fb6f476c6ae0ca5260e60f3ab240"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "skill-overlay", shell_output("#{bin}/skill-overlay --help")
  end
end
