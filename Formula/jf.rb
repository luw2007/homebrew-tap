class Jf < Formula
  desc "LLM-optimized JSON formatter for better readability and token efficiency"
  homepage "https://github.com/luw2007/llm_json_formatter"
  license "MIT"
  version "0.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/llm_json_formatter/releases/download/v#{version}/jf-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "bbd815ea7bdcc0d7710daef6a573fb8eccd34b4504a1c334cafc9e6821598603"
    else
      odie "Intel macOS binary is not published for v#{version} yet."
    end
  end

  on_linux do
    odie "Linux binaries are not published for v#{version} yet."
  end

  def install
    bin.install "jf"
  end

  test do
    assert_match "Format JSON", shell_output("#{bin}/jf --help")
  end
end
