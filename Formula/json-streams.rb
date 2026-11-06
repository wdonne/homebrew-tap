# Generated with JReleaser 1.27.0 at 2026-11-06T13:16:34.383521+01:00

class JsonStreams < Formula
  desc "JSON Streams"
  homepage "https://jsonstreams.io"
  url "https://github.com/json-event-sourcing/pincette-json-streams/releases/download/2.9.7/pincette-json-streams-2.9.7-jar-with-dependencies.jar", :using => :nounzip
  version "2.9.7"
  sha256 "b372790bf561926c13c226ca46a5f2ffeaeeccc2999658aa048c09962bb3291e"
  license "BSD-2-Clause"

  depends_on "openjdk@21"

  def install
    libexec.install "pincette-json-streams-2.9.7-jar-with-dependencies.jar"

    bin.mkpath
    File.open("#{bin}/json-streams", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/pincette-json-streams-2.9.7-jar-with-dependencies.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/json-streams --version")
    assert_match "2.9.7", output
  end
end
