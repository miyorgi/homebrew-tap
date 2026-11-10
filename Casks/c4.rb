cask "c4" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.0-beta.2"
  sha256 arm:   "22c94d12ec3503df174d7e3ece299d934823406bdce02f0d9dfc62605288033f",
         intel: "14c9ed4a0f5c7bbda54e4a12555e740277b2354b5257123d2a4ee9c38da74496"

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

  zap :not_required

  caveats <<~EOS
    In your project directory, install the bundled authoring skill:
      miyorgi c4 setup

    This is a beta release. Existing project models and skills are preserved
    when the Homebrew package is uninstalled.
  EOS
end
