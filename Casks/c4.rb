cask "c4" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.0-beta.5"
  sha256 arm:   "bd6d9c12bd1227ada715ad161db6c3678e941f8d998b442e4083d681b63966e6",
         intel: "0b9ccc144da1085a24361b3eda16856d5c95bd5a7b095244f24026ccf7dd2723"

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
