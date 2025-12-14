class Dt < Formula
  desc "Run commands, record outputs over time, and diff results with an interactive TUI."
  homepage "https://github.com/luw2007/diff_by_time"
  url "https://github.com/luw2007/diff_by_time/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "1fba17241a3068ddc0376c14887fbd8c2411d95e9510712b607eacc063323ac1"
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

