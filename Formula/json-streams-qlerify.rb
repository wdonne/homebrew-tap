# Generated with JReleaser 1.24.0 at 2026-06-26T23:26:05.407877+02:00

class JsonStreamsQlerify < Formula
  desc "Generate JSON Streams apps and OpenAPI specs from Qlerify"
  homepage "https://github.com/wdonne/json-streams-qlerify"
  version "0.1.0"
  license "BSD-2-Clause"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/wdonne/json-streams-qlerify/releases/download/0.1.0/json-streams-qlerify-0.1.0-aarch64-unknown-linux-musl.zip"
    sha256 "7a34c9154f44addcbb2b14811bf070d6a5fc40f2bf8d5bc9969f9c76590f5538"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/wdonne/json-streams-qlerify/releases/download/0.1.0/json-streams-qlerify-0.1.0-x86_64-unknown-linux-musl.zip"
    sha256 "eff4d9a9f8710c183284d1f18450e2df73ff13dcb5a15b2cc212b22d9ad0fb6f"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/wdonne/json-streams-qlerify/releases/download/0.1.0/json-streams-qlerify-0.1.0-aarch64-apple-darwin.zip"
    sha256 "90fbe6be62d3988502c0ab9507bf87d77248b12239df930658a5aa5008f0bd88"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/wdonne/json-streams-qlerify/releases/download/0.1.0/json-streams-qlerify-0.1.0-x86_64-apple-darwin.zip"
    sha256 "8f11b2602b6908c41bce079d242d2b67ac34acef2306d1ae85a6f93e785706dc"
  end


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/json-streams-qlerify" => "json-streams-qlerify"
  end

  test do
    output = shell_output("#{bin}/json-streams-qlerify --version")
    assert_match "0.1.0", output
  end
end
