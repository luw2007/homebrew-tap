class Jf < Formula
  desc "LLM-optimized JSON formatter for better readability and token efficiency"
  homepage "https://github.com/luw2007/llm_json_formatter"
  license "MIT"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/llm_json_formatter/releases/download/v#{version}/jf-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "45550c9d489dcacfb0ec919f98c8f72b01594f7d9951691648b662589b2e5196"
    else
      url "https://github.com/luw2007/llm_json_formatter/releases/download/v#{version}/jf-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "5f58046e2043e30fc0092b51c7c228f3d244ada73b2ed1c3fa429c78f39cd58f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/llm_json_formatter/releases/download/v#{version}/jf-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ba98210c302edc6cd6b4832f94fcd5c6095e3a90e755864d173e7a2398e42314"
    else
      url "https://github.com/luw2007/llm_json_formatter/releases/download/v#{version}/jf-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "530480cca864c7a62d56d3a009fb45a72d2e2f893bd919c9e2b0d1cb97d99fee"
    end
  end

  def install
    bin.install "jf"
  end

  test do
    assert_match "Format JSON", shell_output("#{bin}/jf --help")
  end
end
