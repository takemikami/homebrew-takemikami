RDFLINT_VERSION='0.1.0'
class Rdflint < Formula
  desc "rdflint: RDF linter"
  homepage "https://github.com/imas/rdflint"
  url "https://jitpack.io/com/github/imas/rdflint/#{RDFLINT_VERSION}/rdflint-#{RDFLINT_VERSION}-all.jar"
  sha256 "60771d91a268662279112c94570066fd45779b0c361ee8d0b9a959a20cf2aaa7"

  depends_on :macos
  depends_on :java

  def install
    system "echo '#!/bin/sh' > rdflint"
    system "echo 'JAVA_HOME=$(/usr/libexec/java_home)' >> rdflint"
    system "echo '$JAVA_HOME/bin/java' -jar #{libexec}/rdflint-#{RDFLINT_VERSION}-all.jar '$@' >> rdflint"
    system "chmod 555 rdflint"
    libexec.install "rdflint-#{RDFLINT_VERSION}-all.jar"
    bin.install 'rdflint'
  end

  test do
    system "#{bin}/rdflint"
  end
end
