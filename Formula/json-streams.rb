# Generated with JReleaser 1.27.0 at 2026-11-19T10:42:12.216177+01:00

class JsonStreams < Formula
  desc "JSON Streams"
  homepage "https://jsonstreams.io"
  url "https://github.com/json-event-sourcing/pincette-json-streams/releases/download/2.9.8/pincette-json-streams-2.9.8-jar-with-dependencies.jar", :using => :nounzip
  version "2.9.8"
  sha256 "677e0777085a1d68aa8a93b61a978ffa3bdf2ae69ad8b635d9f6ffa9dff98169"
  license "BSD-2-Clause"

  depends_on "openjdk@21"

  def install
    libexec.install "pincette-json-streams-2.9.8-jar-with-dependencies.jar"

    bin.mkpath
    File.open("#{bin}/json-streams", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/pincette-json-streams-2.9.8-jar-with-dependencies.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/json-streams --version")
    assert_match "2.9.8", output
  end
end
