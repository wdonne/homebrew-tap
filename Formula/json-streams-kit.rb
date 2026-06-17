# Generated with JReleaser 1.24.0 at 2026-06-17T19:46:22.614598+02:00

class JsonStreamsKit < Formula
  desc "JSON Streams utilities"
  homepage "https://jsonstreams.io"
  url "https://github.com/json-event-sourcing/pincette-jes-cli/releases/download/3.1.5/pincette-jes-cli-3.1.5-jar-with-dependencies.jar", :using => :nounzip
  version "3.1.5"
  sha256 "83b06c021d37acb2a5bc49a0cb1d6996d2301b82ef73b828357600afb71c3913"
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
