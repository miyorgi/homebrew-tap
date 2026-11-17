cask "c4" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.0-beta.10"
  sha256 arm:   "8eec4a920c4a449e687fa90b6d6492cf6284f40ead70c0d4df54d594020a7be2",
         intel: "df52a4f5fc9fa9d9572dd095f4f4396eb1649887ff1569a688fd508de02e86fc"

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
