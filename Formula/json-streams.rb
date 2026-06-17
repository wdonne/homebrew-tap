# Generated with JReleaser 1.24.0 at 2026-06-17T16:59:54.130665+02:00

class JsonStreams < Formula
  desc "JSON Streams"
  homepage "https://jsonstreams.io"
  url "https://github.com/json-event-sourcing/pincette-json-streams/releases/download/2.9.1/pincette-json-streams-2.9.1-jar-with-dependencies.jar", :using => :nounzip
  version "2.9.1"
  sha256 "9978ad10d29dcb0f3881131540608eb140341d7c4beb1e97402b755d9bd73f96"
  license "BSD-2-Clause"

  depends_on "openjdk@21"

  def install
    libexec.install "pincette-json-streams-2.9.1-jar-with-dependencies.jar"

    bin.mkpath
    File.open("#{bin}/json-streams", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/pincette-json-streams-2.9.1-jar-with-dependencies.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/json-streams --version")
    assert_match "2.9.1", output
  end
end
