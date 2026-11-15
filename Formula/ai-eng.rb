class AiEng < Formula
  desc "Set up and verify a dual-conductor (Claude Code + Codex) workflow in Git repos"
  homepage "https://github.com/nathanZKL/dual-conductor-factory"
  url "https://github.com/nathanZKL/dual-conductor-factory/releases/download/v0.2.1/ai-eng-0.2.1.pyz"
  version "0.2.1"
  sha256 "5b1ea1e4998aa840ef5c261f4b82977cb84af7a3cbe57c499cc3381f26eeb4e9"
  license "MIT"

  depends_on "python@3.13"

  def install
    libexec.install "ai-eng-0.2.1.pyz" => "ai-eng.pyz"
    (bin/"ai-eng").write <<~SH
      #!/bin/sh
      exec "#{formula_opt_bin("python@3.13")}/python3" "#{libexec}/ai-eng.pyz" "$@"
    SH
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai-eng --version")
  end
end
