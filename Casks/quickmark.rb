cask "quickmark" do
  version "0.2.0"
  sha256 "4f8d8f8dff8b1a0a6458231ade9652f38490ca23dc7a682b48da4f575e7c603a"

  url "https://github.com/syhner/quick-mark/releases/download/v#{version}/QuickMark.zip"
  name "QuickMark"
  desc "Minimal app for marking up screenshots"
  homepage "https://github.com/syhner/quick-mark"

  depends_on macos: :sequoia

  app "QuickMark.app"

  # QuickMark isn't notarized: clear quarantine so macOS doesn't block the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/QuickMark.app"]
  end

  zap trash: [
    "~/Library/Preferences/io.github.syhner.QuickMark.plist",
    "~/Library/Saved Application State/io.github.syhner.QuickMark.savedState",
  ]
end
