class AiEng < Formula
  desc "Set up and verify a dual-conductor (Claude Code + Codex) workflow in Git repos"
  homepage "https://github.com/nathanZKL/dual-conductor-factory"
  url "https://github.com/nathanZKL/dual-conductor-factory/releases/download/v0.3.0/ai-eng-0.3.0.pyz"
  version "0.3.0"
  sha256 "c542b47f81bef827438f036bacb15e011aa9c52e954dae7ab2f4e975609f25b0"
  license "MIT"

  depends_on "python@3.13"

  def install
    libexec.install "ai-eng-0.3.0.pyz" => "ai-eng.pyz"
    (bin/"ai-eng").write <<~SH
      #!/bin/sh
      exec "#{formula_opt_bin("python@3.13")}/python3" "#{libexec}/ai-eng.pyz" "$@"
    SH
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai-eng --version")
  end
end
