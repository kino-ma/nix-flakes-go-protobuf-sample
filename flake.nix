{
  description = "LocalFog";

  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixpkgs-unstable"; };
    flake-utils = { url = "github:numtide/flake-utils"; };
  };

  outputs = { self, nixpkgs, flake-utils }: 
    flake-utils.lib.eachDefaultSystem (system:
      let
        inherit (nixpkgs.lib) optional;
        pkgs = import nixpkgs { inherit system; };
      in
      {
        # Go コンパイラ， Go 向け Protobuf コンパイラが有効な開発用シェル
        devShell = pkgs.mkShell {
          buildInputs = [
            pkgs.go
            pkgs.protobuf
            pkgs.protoc-gen-go
          ];
        };
      });
}