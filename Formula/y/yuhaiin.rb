class Yuhaiin < Formula
  desc "Fast, cross-platform, and multi-protocol proxy tool"
  homepage "https://github.com/yuhaiin"
  url "https://github.com/yuhaiin/yuhaiin.git",
      tag: "v0.3.8"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on "go" => :build

  conflicts_with "yuhaiin-dev"
  conflicts_with "yuhaiin-beta"

  def install
    system "make", "yuhaiin"
    bin.install "yuhaiin"
  end

  service do
    run opt_bin/"yuhaiin"
    keep_alive false
    log_path var/"log/yuhaiin.log"
    error_log_path var/"log/yuhaiin.log"
  end

  test do
    assert_match "v0.3.8", shell_output("#{bin}/yuhaiin -v")
  end
end
