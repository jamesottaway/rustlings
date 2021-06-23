{ pkgs ? import <nixpkgs> { } }:

let rustlings = pkgs.callPackage ./default.nix { };

in pkgs.mkShell {
  buildInputs = [ rustlings pkgs.rustc pkgs.libiconv pkgs.pkgconfig ];
}
