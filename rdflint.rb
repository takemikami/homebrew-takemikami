RDFLINT_VERSION='0.1.1'
class Rdflint < Formula
  desc "rdflint: RDF linter"
  homepage "https://github.com/imas/rdflint"
  url "https://jitpack.io/com/github/imas/rdflint/#{RDFLINT_VERSION}/rdflint-#{RDFLINT_VERSION}.jar"
  sha256 "0d08a886646d11751a4c3648b25fbb49712cbf1ec67d30885d05ce2388023132"

  depends_on :macos
  depends_on :java

  def install
    system "echo '#!/bin/sh' > rdflint"
    system "echo 'JAVA_HOME=$(/usr/libexec/java_home)' >> rdflint"
    system "echo '$JAVA_HOME/bin/java' -jar #{libexec}/rdflint-#{RDFLINT_VERSION}.jar '$@' >> rdflint"
    system "chmod 555 rdflint"
    libexec.install "rdflint-#{RDFLINT_VERSION}.jar"
    bin.install 'rdflint'
  end

  test do
    system "#{bin}/rdflint"
  end
end
