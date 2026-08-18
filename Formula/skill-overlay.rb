class SkillOverlay < Formula
  desc "Keep local skill customizations across upstream Agent Skills updates"
  homepage "https://github.com/luw2007/skill-overlay"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/skill-overlay/releases/download/v0.1.2/skill-overlay-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "f7562a5fb52faa0c348a0a6890befd974d73e757e9c10eef90597f4979d8723c"
    else
      url "https://github.com/luw2007/skill-overlay/releases/download/v0.1.2/skill-overlay-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "aac1e1902db59b35616a921a4cec599937f34fbc95ca36ac1edad337d976fcee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/skill-overlay/releases/download/v0.1.2/skill-overlay-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6a50aae636e09ccc074ff7e2060954582a7cf290724eff481b95864ff38565b4"
    else
      url "https://github.com/luw2007/skill-overlay/releases/download/v0.1.2/skill-overlay-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "889c612c7ac44cda7aa2f3fb78ff925bf702b6e4b48c29749c320f7bb68cb4cd"
    end
  end

  def install
    bin.install "skill-overlay"
    bin.install_symlink "skill-overlay" => "overlay"
  end

  test do
    assert_match "skill-overlay", shell_output("#{bin}/skill-overlay --help")
    assert_match "Usage: overlay", shell_output("#{bin}/overlay --help")
  end
end
