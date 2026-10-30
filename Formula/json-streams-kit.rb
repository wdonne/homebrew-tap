# Generated with JReleaser 1.26.0 at 2026-10-30T12:20:20.982845+01:00

class JsonStreamsKit < Formula
  desc "JSON Streams utilities"
  homepage "https://jsonstreams.io"
  url "https://github.com/json-event-sourcing/pincette-jes-cli/releases/download/3.1.9/pincette-jes-cli-3.1.9-jar-with-dependencies.jar", :using => :nounzip
  version "3.1.9"
  sha256 "a342cdf93135cb9b660e20b184dbbd0ac2961fb6216517c8d56152a9845085ca"
  license "BSD-2-Clause"

  depends_on "openjdk@21"

  def install
    libexec.install "pincette-jes-cli-3.1.9-jar-with-dependencies.jar"

    bin.mkpath
    File.open("#{bin}/json-streams-kit", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/pincette-jes-cli-3.1.9-jar-with-dependencies.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/json-streams-kit --version")
    assert_match "3.1.9", output
  end
end
