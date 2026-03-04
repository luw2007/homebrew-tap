class Jf < Formula
  desc "LLM-optimized JSON formatter for better readability and token efficiency"
  homepage "https://github.com/luw2007/llm_json_formatter"
  license "MIT"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/llm_json_formatter/releases/download/v#{version}/jf-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "cf2eae65a411aec03428d2dc47410176e0d8f23e00bc44cd8e1ce976e8e0ed9f"
    else
      url "https://github.com/luw2007/llm_json_formatter/releases/download/v#{version}/jf-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "REPLACE_WITH_X86_64_SHA256_WHEN_AVAILABLE"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/llm_json_formatter/releases/download/v#{version}/jf-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "REPLACE_WITH_LINUX_ARM64_SHA256_WHEN_AVAILABLE"
    else
      url "https://github.com/luw2007/llm_json_formatter/releases/download/v#{version}/jf-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "REPLACE_WITH_LINUX_X86_64_SHA256_WHEN_AVAILABLE"
    end
  end

  def install
    bin.install "jf"
  end

  test do
    assert_match "Format JSON", shell_output("#{bin}/jf --help")
  end
end
