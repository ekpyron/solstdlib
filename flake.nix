{
  description = "new solidity stdlib";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    solcore.url = "github:d-xo/solcore?ref=alex-happy-cabal";
    hm-typecheck.url = "github:mbenke/hm-typecheck";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = ins:
    ins.flake-utils.lib.eachDefaultSystem (system : let
      pkgs = import ins.nixpkgs { inherit system; };
    in {
      devShells.default = pkgs.mkShell {
        buildInputs = [
          (pkgs.haskell.lib.dontCheck ins.solcore.packages.${system}.default)
          ins.hm-typecheck.packages.${system}.default
        ];
      };
    });
}
