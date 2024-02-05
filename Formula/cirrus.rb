# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class CirrusSdk < Formula
  desc "Cirrus SDK for Galvanize"
  homepage "https://www.galvanize.com/"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://gitlab.galvanize.com/api/v4/projects/4178/packages/generic/cirrus-sdk-releases/v2.1.11/cirrus-sdk-darwin-arm64.tar.gz"
      sha256 "18486e7c18f6367286e003fd8b9ea6db3e94578d18b5f5c9a6f7654b611a0328"

      def install
        bin.install "cirrus-sdk-darwin-arm64" => "glv-cloud-cli"
      end
    end
    if Hardware::CPU.intel?
      url "https://gitlab.galvanize.com/api/v4/projects/4178/packages/generic/cirrus-sdk-releases/v2.1.11/cirrus-sdk-darwin-amd64.tar.gz"
      sha256 "eaa9fc98156803d776803158c7c4235ea5436cc5c1198be9d9fb58236b5a5426"

      def install
        bin.install "cirrus-sdk-darwin-amd64" => "glv-cloud-cli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://gitlab.galvanize.com/api/v4/projects/4178/packages/generic/cirrus-sdk-releases/v2.1.11/cirrus-sdk-linux-amd64.tar.gz"
      sha256 "3a50e84ea2dd54d3e662130c87fe8b0f47ca4e763215b90ab197d1e78f7d349f"

      def install
        bin.install "cirrus-sdk-linux-amd64" => "glv-cloud-cli"
      end
    end
  end

  test do
    system "#{bin}/glv-cloud-cli", "--help"
  end
end
