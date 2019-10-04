RDFLINT_VERSION='0.0.9'
class Rdflint < Formula
  desc "rdflint: RDF linter"
  homepage "https://github.com/imas/rdflint"
  url "https://jitpack.io/com/github/imas/rdflint/#{RDFLINT_VERSION}/rdflint-#{RDFLINT_VERSION}-all.jar"
  sha256 "94feeca875a521307a3c4ba51e2806ea5ba664175569c8dc2d40860db0105cdc"

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
