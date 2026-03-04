class Dt < Formula
  desc "Run commands, record outputs over time, and diff results with an interactive TUI."
  homepage "https://github.com/luw2007/diff_by_time"
  url "https://github.com/luw2007/diff_by_time/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "931cf079dfbca6109030ed7a15e006ec07634d380240f19ae5c31eaddbbb3103"
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

