require "language/node"

class SentientLang < Formula
  desc "Sentient Language Compiler and Runtime"
  homepage "http://sentient-lang.org/"
  url "https://github.com/sentient-lang/sentient-lang/archive/v0.0.0-beta.1.tar.gz"
  version "0.0.0-beta.1"
  sha256 "64ab82bd872cef0f3adea3affe91a82c905710a0f2079787272a5b485699d704"
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
