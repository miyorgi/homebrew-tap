cask "c4" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.0-beta.4"
  sha256 arm:   "0efb2e8952a503d6bf4a44168b59874b8ed2533ebb1a8aff5082c4c282469f2d",
         intel: "6b906091a24af663a9dbb9c12788bb01f6adb0ab1fa20c7e7fb2053911feea1f"

  url "https://downloads.miyorgi.com/c4/#{version}/miyorgi-c4-#{version}-darwin-#{arch}.zip?download=1"
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
