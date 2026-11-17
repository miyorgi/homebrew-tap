cask "c4" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.0-beta.9"
  sha256 arm:   "931479079b611c709c2d67cd80b159dd3b25cd711297b1adf3013f317eda3803",
         intel: "b18597f101e2fbece7fd60a2551a08125aae22ed130b96d8cc6f8ccf4a18f292"

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
