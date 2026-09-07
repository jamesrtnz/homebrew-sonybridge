cask "sonybridge" do
  version "0.3.3"
  sha256 "34e69665b5ef2c87baaacb76aa95c121bf505603f9d604ae6de37243f36b1163"

  url "https://github.com/AmitRajput-Dev/SonyBridge/releases/download/v#{version}/SonyBridge-macOS.zip"
  name "SonyBridge"
  desc "Control Sony headphones (noise cancelling, ambient sound, EQ, battery) from macOS"
  homepage "https://github.com/AmitRajput-Dev/SonyBridge"

  depends_on macos: :big_sur

  app "SonyBridge.app"

  # App is ad-hoc signed (not notarized); clear quarantine so it launches without a Gatekeeper block.
  postflight_steps do
    run "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "{{appdir}}/SonyBridge.app"]
  end

  caveats <<~EOS
    Connect your Sony headphones in macOS Bluetooth settings, then open SonyBridge.
    If macOS still blocks it, run:
      xattr -dr com.apple.quarantine "#{appdir}/SonyBridge.app"
  EOS
end
