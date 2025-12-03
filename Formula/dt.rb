class Dt < Formula
  desc "Run commands, record outputs over time, and diff results with an interactive TUI."
  homepage "https://github.com/luw2007/diff_by_time"
  url "https://github.com/luw2007/diff_by_time/archive/refs/tags/v0.1.9.tar.gz"
  sha256 "19ce24d89e2b02ae63abb477264059a63a4ed1d3d5e6a51552844978a100ad92"
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

