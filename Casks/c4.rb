cask "c4" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.0-beta.7"
  sha256 arm:   "9712cbe060c597e043d18e0bebaec950ce8cccd2fe0cc43d43be4bc33acbb3b2",
         intel: "177d89c0ff364d3c847e92f9e650426805c5d6ea307c7d0e40b8994066a7f5fa"

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
