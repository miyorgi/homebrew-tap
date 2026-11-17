cask "c4" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.0-beta.8"
  sha256 arm:   "d02edf7a67054c415a1fddb822e450b2623a2ca5c69959c2a02e687f3fb80493",
         intel: "c4035e17677f11e856dd29c5bfc58580b3cfcbefd3686ff7bb124b4ffe94639a"

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
