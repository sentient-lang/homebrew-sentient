require "language/node"

class SentientLang < Formula
  desc "Sentient Language Compiler and Runtime"
  homepage "http://sentient-lang.org/"
  url "https://github.com/sentient-lang/sentient-lang/archive/v0.0.0-alpha.42.tar.gz"
  version "0.0.0-alpha.42"
  sha256 "5e4b88a11bffabb07f4c9475c9d4fa013501a5eb04e804cd0be9e42ab24c8931"
  head "https://github.com/sentient-lang/sentient-lang.git"

  depends_on "node"
  depends_on "sentient-lang/riss/riss" => :recommended
  depends_on "sentient-lang/lingeling/lingeling" => :recommended

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    (testpath/"test.snt").write("a = 2 + 2; expose a;")
    system bin/"sentient", "test.snt"
  end
end
