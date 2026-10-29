class Inauguration < Formula
  desc "Capability-aware polyglot compiler and orchestration language CLI"
  homepage "https://github.com/tschk/inauguration"
  url "https://github.com/tschk/inauguration/archive/refs/tags/v0.9.11.tar.gz"
  sha256 "157ec8b2a1f41d0909639b8dd466fc6b4e85443f832176c2662463d288b912aa"
  license "MPL-2.0"
  head "https://github.com/tschk/inauguration.git", branch: "main"

  depends_on "rust" => :build

  def install
    cd "in-cli" do
      system "cargo", "install", *std_cargo_args(path: ".")
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/in --version")
  end
end
