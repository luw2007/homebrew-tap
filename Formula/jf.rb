class Jf < Formula
  desc "LLM-optimized JSON formatter for better readability and token efficiency"
  homepage "https://github.com/luw2007/llm_json_formatter"
  license "MIT"
  version "0.1.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/llm_json_formatter/releases/download/v#{version}/jf-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "55076cf48fd62c21a696254dade81d90747ae1404115691a44668b1dbe815c4e"
    else
      url "https://github.com/luw2007/llm_json_formatter/releases/download/v#{version}/jf-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "a8e437cd5f5f5a068923af7cded5b70cc57eb8d2a2274715ad2034a257610224"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luw2007/llm_json_formatter/releases/download/v#{version}/jf-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a001088802beeaaf8ae29c432d653c0a11b76d34598f0df8b15b1cbd3af4210d"
    else
      url "https://github.com/luw2007/llm_json_formatter/releases/download/v#{version}/jf-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a060812f4c668fdb4bfaa893efbcf3e8336a25b804f604fface75a5356347b50"
    end
  end

  def install
    bin.install "jf"
  end

  test do
    assert_match "Format JSON", shell_output("#{bin}/jf --help")
  end
end
