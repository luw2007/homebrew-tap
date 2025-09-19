class Dt < Formula
  desc "Diff and run commands with time-based history"
  homepage "https://github.com/luw2007/diff_by_time"
  url "https://github.com/luw2007/diff_by_time/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "2969ff421463cd8e1e9374ec032af7ad81bbf9905dc3558762b8bcef4506adbe"
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
