# Generated with JReleaser 1.24.0 at 2026-05-23T22:10:47.981374+02:00

class JsonStreamsKit < Formula
  desc "JSON Streams utilities"
  homepage "https://jsonstreams.io"
  url "https://github.com/json-event-sourcing/pincette-jes-cli/releases/download/3.1.4/pincette-jes-cli-3.1.4-jar-with-dependencies.jar", :using => :nounzip
  version "3.1.4"
  sha256 "d87f448d2b3948716dde179358b07ad9f0cf3ffd7953b8540a90cfc4185c7cb2"
  license "BSD-2-Clause"

  depends_on "openjdk@21"

  def install
    libexec.install "pincette-jes-cli-3.1.4-jar-with-dependencies.jar"

    bin.mkpath
    File.open("#{bin}/json-streams-kit", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/pincette-jes-cli-3.1.4-jar-with-dependencies.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/json-streams-kit --version")
    assert_match "3.1.4", output
  end
end
