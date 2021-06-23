{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.simpleFlake {
      inherit self nixpkgs;
      name = "rustlings";
      overlay = ./overlay.nix;
      shell = ./shell.nix;
      systems = utils.lib.defaultSystems;
    };
}
