# Installs upstream wax from its tagged source archive. Upstream also publishes
# pre-built release binaries for `wax self-update`.
class Wax < Formula
  desc "Fast Homebrew-compatible package manager"
  homepage "https://github.com/plyght/wax"
  url "https://github.com/plyght/wax/archive/refs/tags/v0.20.31.tar.gz"
  sha256 "369d0f191520037fdfc7e6fdc89ee76c57728f9f8bcf7d4739bbf3ac42a46e10"
  license "MIT"
  head "https://github.com/plyght/wax.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # HEAD builds report Homebrew version "HEAD-<sha>" but the crate's Cargo version.
    expected = build.head? ? /^wax \d+\.\d+\.\d+/ : version.to_s
    assert_match expected, shell_output("#{bin}/wax --version")
  end
end
