class Jf < Formula
  desc "LLM-optimized JSON formatter for better readability and token efficiency"
  homepage "https://github.com/luw2007/llm_json_formatter"
  license "MIT"
  version "0.1.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/llm_json_formatter/releases/download/v0.1.6/jf-v0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "Downloading https://github.com/luw2007/llm_json_formatter/releases/download/v0.1.6/jf-v0.1.6-aarch64-apple-darwin.tar.gz ...
f1d0b192552ae1ba7ae2d3363c9ea990abc77bd124ea5662c70a75c15c91029b"
    else
      url "https://github.com/luw2007/llm_json_formatter/releases/download/v0.1.6/jf-v0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "Downloading https://github.com/luw2007/llm_json_formatter/releases/download/v0.1.6/jf-v0.1.6-x86_64-apple-darwin.tar.gz ...
091dec5da7bf3dafd456b9c69eea0fd3386009555f03bc73777ca8a6418351dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/llm_json_formatter/releases/download/v0.1.6/jf-v0.1.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "Downloading https://github.com/luw2007/llm_json_formatter/releases/download/v0.1.6/jf-v0.1.6-aarch64-unknown-linux-gnu.tar.gz ...
fb144984de8466268163e27461bb5fdd68f8dc2db31ad78af760468d8b0eff1a"
    else
      url "https://github.com/luw2007/llm_json_formatter/releases/download/v0.1.6/jf-v0.1.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "Downloading https://github.com/luw2007/llm_json_formatter/releases/download/v0.1.6/jf-v0.1.6-x86_64-unknown-linux-gnu.tar.gz ...
1a90a661a9c094d9efd4d5c05b9fa6a4d371a68a69cbdb359ea28f505a974bfe"
    end
  end

  def install
    bin.install "jf"
  end

  test do
    assert_match "Format JSON", shell_output("#{bin}/jf --help")
  end
end
