cask "gateway-dotfiles" do
  version "20230616"
  sha256 :no_check

  url "https://github.com/gatewaymedia/dotfiles.git",
      branch:   "main"
  name "Gateway Dotfiles"
  homepage "https://github.com/gatewaymedia/dotfiles"

  artifact ".hyper.js", target: "~/.hyper.js"
  artifact ".zshrc", target: "~/.zshrc"
end
