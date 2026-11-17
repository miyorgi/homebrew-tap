cask "c4" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.0-beta.12"
  sha256 arm:   "e3ed9e40355c0b605c864455931602d84aa1436c0055116516d5f39f67b7c779",
         intel: "3f4542293d4aeb55a2ffdf560bf3454d9277f79e82d286cf2e10aa96f2f52be3"

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
