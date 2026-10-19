# Generated with JReleaser 1.26.0 at 2026-10-19T11:31:01.210926+02:00

class JsonStreams < Formula
  desc "JSON Streams"
  homepage "https://jsonstreams.io"
  url "https://github.com/json-event-sourcing/pincette-json-streams/releases/download/2.9.6/pincette-json-streams-2.9.6-jar-with-dependencies.jar", :using => :nounzip
  version "2.9.6"
  sha256 "e76411fe212049a8fdb5d06d6a3c8cadbeeb1b561c2b6a6aa94532efd1fb3abf"
  license "BSD-2-Clause"

  depends_on "openjdk@21"

  def install
    libexec.install "pincette-json-streams-2.9.6-jar-with-dependencies.jar"

    bin.mkpath
    File.open("#{bin}/json-streams", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/pincette-json-streams-2.9.6-jar-with-dependencies.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/json-streams --version")
    assert_match "2.9.6", output
  end
end
