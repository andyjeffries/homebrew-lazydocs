class Lazydocs < Formula
  desc 'Lazygit-style TUI for browsing DevDocs documentation offline'
  homepage 'https://github.com/andyjeffries/lazydocs'
  url 'https://github.com/andyjeffries/lazydocs/archive/refs/tags/v0.1.0.tar.gz'
  sha256 '7ef38e9bcc8a2bbcae0e88930572d9542a2d87009a5b031abdca019b68686c5a'
  license 'MIT'
  head 'https://github.com/andyjeffries/lazydocs.git', branch: 'main'

  depends_on 'go' => :build
  depends_on 'sqlite'

  def install
    system 'go', 'build', *std_go_args(ldflags: "-s -w -X main.version=#{version}"),
           '-tags', 'sqlite_fts5', './cmd/lazydocs'
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lazydocs --version")
  end
end
