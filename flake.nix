{
  description = "new solidity stdlib";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    hm-typecheck.url = "github:d-xo/hm-typecheck?ref=nix";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = ins:
    ins.flake-utils.lib.eachDefaultSystem (system : let
      pkgs = import ins.nixpkgs { inherit system; };
    in {
      devShells.default = pkgs.mkShell {
        buildInputs = [ ins.hm-typecheck.packages.${system}.default ];
      };
    });
}
