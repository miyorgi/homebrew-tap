cask "c4" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.0-beta.11"
  sha256 arm:   "104b70446d18254cb89a762f78e239cb5cbd002f031e324c77feed268fea66db",
         intel: "ff1c0f0a0bc83fca0ff3cbe62c2c29765d2d583f47d4c8f8f12d6e54ff64e972"

  url "https://downloads.miyorgi.com/c4/#{version}/miyorgi-c4-#{version}-darwin-#{arch}.zip"
  name "Miyorgi C4"
  desc "Model software architecture and preview C4 diagrams"
  homepage "https://miyorgi.com/c4/"

  livecheck do
    url "https://downloads.miyorgi.com/c4/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  binary "miyorgi-c4-#{version}-darwin-#{arch}/bin/miyorgi"

  caveats <<~EOS
    In your project directory, install the bundled authoring skill:
      miyorgi c4 setup

    This is a beta release. Existing project models and skills are preserved
    when the Homebrew package is uninstalled.
  EOS
end
