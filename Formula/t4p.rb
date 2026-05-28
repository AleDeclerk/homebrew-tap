# t4p — Homebrew formula
#
# Written by hand because goreleaser deprecated formula generation in
# v2.16 in favor of homebrew_casks. Casks taint macOS binaries with
# quarantine semantics that survive xattr removal, so for unsigned CLI
# binaries a formula is still the right shape until we notarize.
class T4p < Formula
  desc "Free LLM tokens for the rest of us — a Go wizard that wires Cline/Continue/Aider/LiteLLM to free tiers"
  homepage "https://github.com/AleDeclerk/tokensforthepeople"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AleDeclerk/tokensforthepeople/releases/download/v#{version}/t4p_#{version}_darwin_arm64.tar.gz"
      sha256 "da5c47a42d171e63c281ef723d87bdf493a97c71e1e8f8bf87baf815f1d0f6d7"
    end
    on_intel do
      url "https://github.com/AleDeclerk/tokensforthepeople/releases/download/v#{version}/t4p_#{version}_darwin_amd64.tar.gz"
      sha256 "d924d89e9c6b0b08773b772f9635f808a2e2187b793f9d8c0ea5c08445fc813e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AleDeclerk/tokensforthepeople/releases/download/v#{version}/t4p_#{version}_linux_arm64.tar.gz"
      sha256 "452502b86deba46956646480264f47ae91ade13ec666559ce1a69edde02391f9"
    end
    on_intel do
      url "https://github.com/AleDeclerk/tokensforthepeople/releases/download/v#{version}/t4p_#{version}_linux_amd64.tar.gz"
      sha256 "9ef6e561989519f4a55adf12f2aa9a03b15c03bb61d5df9591abd9832a6402e3"
    end
  end

  def install
    bin.install "t4p"
  end

  test do
    assert_match "t4p", shell_output("#{bin}/t4p version")
  end
end
