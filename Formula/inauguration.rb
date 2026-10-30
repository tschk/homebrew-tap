class Inauguration < Formula
  desc "Capability-aware polyglot compiler and orchestration language CLI"
  homepage "https://github.com/tschk/inauguration"
  url "https://github.com/tschk/inauguration/archive/refs/tags/v0.9.322.tar.gz"
  sha256 "26dba9ddf57ada64ce6025d3d44725fcf7db0834b84b0e08171304db63593fee"
  license "MPL-2.0"
  head "https://github.com/tschk/inauguration.git", branch: "main"

  depends_on "rust" => :build

  def install
    cd "in-cli" do
      system "cargo", "install", *std_cargo_args(path: ".")
    end
  end

  test do
    # HEAD builds report Homebrew version "HEAD-<sha>" but the crate's Cargo version.
    expected = build.head? ? /^in \d+\.\d+\.\d+/ : version.to_s
    assert_match expected, shell_output("#{bin}/in --version")
  end
end
