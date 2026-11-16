class AiEng < Formula
  desc "Set up and verify a dual-conductor (Claude Code + Codex) workflow in Git repos"
  homepage "https://github.com/nathanZKL/dual-conductor-factory"
  url "https://github.com/nathanZKL/dual-conductor-factory/releases/download/v0.4.0/ai-eng-0.4.0.pyz"
  version "0.4.0"
  sha256 "17c80bb43cb639c5b5b368d625a66e64f82d69b61a0ab44589d066be7f78bf08"
  license "MIT"

  depends_on "python@3.13"

  def install
    libexec.install "ai-eng-0.4.0.pyz" => "ai-eng.pyz"
    (bin/"ai-eng").write <<~SH
      #!/bin/sh
      exec "#{formula_opt_bin("python@3.13")}/python3" "#{libexec}/ai-eng.pyz" "$@"
    SH
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai-eng --version")
  end
end
