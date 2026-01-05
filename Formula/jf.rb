class Jf < Formula
  desc "LLM-optimized JSON formatter for better readability and token efficiency"
  homepage "https://github.com/luw2007/llm_json_formatter"
  url "https://github.com/luw2007/llm_json_formatter/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "57504ad643d53ee918c4b8a29f3348489f1fb57c83e49fd56e8222edb60fd7fc"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    input = '{"name":"Alice","age":30}'
    output = pipe_output("#{bin}/jf format", input)
    assert_match '"age"', output
    assert_match '"name"', output
  end
end
