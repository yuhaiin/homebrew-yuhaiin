class YuhaiinDev < Formula
  desc "Fast, cross-platform, and multi-protocol proxy tool"
  homepage "https://github.com/yuhaiin"
  head "https://github.com/yuhaiin/yuhaiin.git", branch: "main"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on "go" => :build

  conflicts_with "yuhaiin-beta"
  conflicts_with "yuhaiin"

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
    assert_match "version:", shell_output("#{bin}/yuhaiin -v")
  end
end
