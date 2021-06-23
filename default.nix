{ lib, stdenv, rustPlatform, darwin }:

let
  nixignore = [
    ./exercises
    ./target
    ./default.nix
    ./flake.nix
    ./flake.lock
    ./overlay.nix
    ./shell.nix
  ];

in rustPlatform.buildRustPackage {
  pname = "rustlings";
  version = "4.4.0";

  src = builtins.path {
    name = "rustlings";
    path = ./.;
    filter = (path: type:
      !(builtins.elem (baseNameOf path) (map baseNameOf nixignore)));
  };

  cargoLock = { lockFile = ./Cargo.lock; };

  buildInputs =
    lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.CoreServices ];
}
