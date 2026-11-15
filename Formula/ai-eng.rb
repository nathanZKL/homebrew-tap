class AiEng < Formula
  desc "Set up and verify a dual-conductor (Claude Code + Codex) workflow in Git repos"
  homepage "https://github.com/nathanZKL/dual-conductor-factory"
  url "https://github.com/nathanZKL/dual-conductor-factory/releases/download/v0.2.0/ai-eng-0.2.0.pyz"
  version "0.2.0"
  sha256 "bb303fb555b90b2b676e649b7a33f945f4d25ad21747d119446880c8b6207aa3"
  license "MIT"

  depends_on "python@3.13"

  def install
    libexec.install "ai-eng-0.2.0.pyz" => "ai-eng.pyz"
    (bin/"ai-eng").write <<~SH
      #!/bin/sh
      exec "#{formula_opt_bin("python@3.13")}/python3" "#{libexec}/ai-eng.pyz" "$@"
    SH
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai-eng --version")
  end
end
