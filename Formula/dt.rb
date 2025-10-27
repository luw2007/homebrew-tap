class Dt < Formula
  desc "Track command history and diff outputs in an interactive TUI"
  homepage "https://github.com/luw2007/diff_by_time"
  url "https://github.com/luw2007/diff_by_time/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "96a02691e0abc8a5225ad373bd434204b27806221851d4ed0177a010b1d9d0c9"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    output = shell_output("#{bin}/dt --version")
    assert_match version.to_s, output
  end
end
