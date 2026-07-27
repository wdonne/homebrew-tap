# Generated with JReleaser 1.25.0 at 2026-07-27T09:59:29.934854+02:00

class JsonStreamsKit < Formula
  desc "JSON Streams utilities"
  homepage "https://jsonstreams.io"
  url "https://github.com/json-event-sourcing/pincette-jes-cli/releases/download/3.1.6/pincette-jes-cli-3.1.6-jar-with-dependencies.jar", :using => :nounzip
  version "3.1.6"
  sha256 "acd263c93e233678501eb19bc0bdd67b3c54b4a5f99208d5a95edbbf8493986a"
  license "BSD-2-Clause"

  depends_on "openjdk@21"

  def install
    libexec.install "pincette-jes-cli-3.1.6-jar-with-dependencies.jar"

    bin.mkpath
    File.open("#{bin}/json-streams-kit", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/pincette-jes-cli-3.1.6-jar-with-dependencies.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/json-streams-kit --version")
    assert_match "3.1.6", output
  end
end
