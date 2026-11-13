cask "c4" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.0-beta.6"
  sha256 arm:   "3ea30068c478fbcdfc5e9897695360e7c8c70c822d8ff616c6f6f3838dac0bee",
         intel: "2b159724bf0c4754e545250a616ba879222343e6f9c4cb625932c8ce326c6ab1"

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
