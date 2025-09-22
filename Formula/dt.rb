class Dt < Formula
  desc "Run commands, record outputs over time, and diff results with an interactive TUI."
  homepage "https://github.com/luw2007/diff_by_time"
  url "https://github.com/luw2007/diff_by_time/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "8e3f2960a84f12104b5cb5ec7dab6da0f0cf3b153c88083657f0af9c5857cc48"
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

