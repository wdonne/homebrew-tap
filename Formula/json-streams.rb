# Generated with JReleaser 1.24.0 at 2026-05-23T21:47:52.934795+02:00

class JsonStreams < Formula
  desc "JSON Streams"
  homepage "https://jsonstreams.io"
  url "https://github.com/json-event-sourcing/pincette-json-streams/releases/download/2.9.0/pincette-json-streams-2.9.0-jar-with-dependencies.jar", :using => :nounzip
  version "2.9.0"
  sha256 "f8710f21f22270c829ebe1e9c420925e1f04f1c60693520fb1184a316821f0e4"
  license "BSD-2-Clause"

  depends_on "openjdk@21"

  def install
    libexec.install "pincette-json-streams-2.9.0-jar-with-dependencies.jar"

    bin.mkpath
    File.open("#{bin}/json-streams", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/pincette-json-streams-2.9.0-jar-with-dependencies.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/json-streams --version")
    assert_match "2.9.0", output
  end
end
