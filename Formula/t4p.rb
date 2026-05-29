# t4p — Homebrew formula
#
# Builds from source via the Go toolchain. This is the canonical
# Homebrew pattern for Go projects (gh, goreleaser, terraform all do
# the same): no precompiled binaries means no Gatekeeper quarantine
# attribute, which sidesteps the unsigned-binary cliff on modern macOS.
# Trades ~30s of install time for a binary that runs the first time.
class T4p < Formula
  desc "Free LLM tokens for the rest of us — a Go wizard that wires Cline/Continue/Aider/LiteLLM to free tiers"
  homepage "https://github.com/AleDeclerk/tokensforthepeople"
  url "https://github.com/AleDeclerk/tokensforthepeople/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "3872a140e103c2c5d27276f7f734a4e9b707e6f08ad26e90ca4d24eac8be104c"
  license "MIT"
  head "https://github.com/AleDeclerk/tokensforthepeople.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.Version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"t4p"), "./cmd/t4p"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/t4p version")
  end
end
