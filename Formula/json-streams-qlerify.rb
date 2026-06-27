# Generated with JReleaser 1.24.0 at 2026-06-27T17:08:38.204955+02:00

class JsonStreamsQlerify < Formula
  desc "Generate JSON Streams apps and OpenAPI specs from Qlerify"
  homepage "https://github.com/wdonne/json-streams-qlerify"
  version "0.1.1"
  license "BSD-2-Clause"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/wdonne/json-streams-qlerify/releases/download/0.1.1/json-streams-qlerify-0.1.1-aarch64-unknown-linux-musl.zip"
    sha256 "576c43e6135b362227d25e98ea475e7619ba9074381dba4e4af8f2c9c15df8c6"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/wdonne/json-streams-qlerify/releases/download/0.1.1/json-streams-qlerify-0.1.1-x86_64-unknown-linux-musl.zip"
    sha256 "68b40a709feb9888b606a11a133f59b2e8c9ad8729f163bf176313e2ba4b9ae1"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/wdonne/json-streams-qlerify/releases/download/0.1.1/json-streams-qlerify-0.1.1-aarch64-apple-darwin.zip"
    sha256 "435cbba57059739ebe14386d127374180a30f6676f8009947ff706d374636c6d"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/wdonne/json-streams-qlerify/releases/download/0.1.1/json-streams-qlerify-0.1.1-x86_64-apple-darwin.zip"
    sha256 "440219f93c3e3aa2d4a0c443fc77b86d87d517bd00c3785f994994e00e89bb26"
  end


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/json-streams-qlerify" => "json-streams-qlerify"
  end

  test do
    output = shell_output("#{bin}/json-streams-qlerify --version")
    assert_match "0.1.1", output
  end
end
