{
  description = "";

  # Use the unstable nixpkgs to use the latest set of node packages
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/master";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem
    (system: let
      pkgs = import nixpkgs {
        inherit system;
      };
    in {
      devShells.default = pkgs.mkShell {
        buildInputs = [
          pkgs.pre-commit
          pkgs.python311
          pkgs.python311Packages.pip
          pkgs.python311Packages.platformdirs
          pkgs.python311Packages.packaging
          pkgs.python311Packages.numpy
          pkgs.python311Packages.scipy
          pkgs.python311Packages.pandas
        ];
      };
    });
}
