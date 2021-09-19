class Helix < Formula
  desc "Post-modern modal text editor"
  homepage "https://helix-editor.com"
  url "https://github.com/jeizsm/helix.git", tag: "v0.4.1", revision: "1caedc18ca47d07b30a5997c092f2683cce3042e"
  license "MPL-2.0"
  head "https://github.com/jeizsm/helix.git", branch: "master"

  bottle do
    root_url "https://github.com/jeizsm/homebrew-helix/releases/download/helix-0.4.1"
    sha256 cellar: :any,                 big_sur:      "b9f9a1360cf4358757251ba46874cd5060ca64fdef90f0b868034b4576767499"
    sha256 cellar: :any,                 catalina:     "cc74d1eec8c3edf7e2ef1a5d34bf2e2404d5458a75acdeaa2add4523a335af08"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e6c92289d49a281b86815e2254e8397295b21fb2ae8a920e0bf82c7e5d9d8517"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(root: libexec, path: "helix-term")
    libexec.install "./runtime"
    (bin/"hx").write_env_script(libexec/"bin/hx", HELIX_RUNTIME: libexec/"runtime")
  end

  test do
    system "hx", "-V"
  end
end
