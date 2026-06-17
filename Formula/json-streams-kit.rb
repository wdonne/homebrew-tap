# Generated with JReleaser 1.24.0 at 2026-06-17T19:47:58.832675+02:00

class JsonStreamsKit < Formula
  desc "JSON Streams utilities"
  homepage "https://jsonstreams.io"
  url "https://github.com/json-event-sourcing/pincette-jes-cli/releases/download/3.1.5/pincette-jes-cli-3.1.5-jar-with-dependencies.jar", :using => :nounzip
  version "3.1.5"
  sha256 "4af314670e4090f52245611913896003d71222e11d6ec8cfa57576983affba0c"
  license "BSD-2-Clause"

  depends_on "openjdk@21"

  def install
    libexec.install "pincette-jes-cli-3.1.5-jar-with-dependencies.jar"

    bin.mkpath
    File.open("#{bin}/json-streams-kit", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/pincette-jes-cli-3.1.5-jar-with-dependencies.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/json-streams-kit --version")
    assert_match "3.1.5", output
  end
end
