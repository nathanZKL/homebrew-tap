class AiEng < Formula
  desc "Set up and verify a dual-conductor (Claude Code + Codex) workflow in Git repos"
  homepage "https://github.com/nathanZKL/dual-conductor-factory"
  url "https://github.com/nathanZKL/dual-conductor-factory/releases/download/v0.1.0/ai-eng-0.1.0.pyz"
  version "0.1.0"
  sha256 "9fcb605cec00853eae75fbf4333c45b834a84a762c2c444c59c4fa74cdc390e9"
  license "MIT"

  depends_on "python@3.13"

  def install
    libexec.install "ai-eng-0.1.0.pyz" => "ai-eng.pyz"
    (bin/"ai-eng").write <<~SH
      #!/bin/sh
      exec "#{formula_opt_bin("python@3.13")}/python3" "#{libexec}/ai-eng.pyz" "$@"
    SH
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai-eng --version")
  end
end
