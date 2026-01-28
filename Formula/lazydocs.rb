class Lazydocs < Formula
  desc 'Lazygit-style TUI for browsing DevDocs documentation offline'
  homepage 'https://github.com/andyjeffries/lazydocs'
  url 'https://github.com/andyjeffries/lazydocs/archive/refs/tags/v0.1.0.tar.gz'
  sha256 '6441ec802048d7d57d6eaf721a36610d4940e22b87674b0b0cf90ae0ea716723'
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
